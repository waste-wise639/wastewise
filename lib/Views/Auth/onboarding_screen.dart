// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/reusables.dart';
import 'package:wastewise/Views/Auth/Components/onboarding_widget..dart';
import 'package:wastewise/Views/Auth/WasteDepositor/waste_disposer_signup.dart';
import 'package:wastewise/Views/Auth/WasteVendor/signup_waste_vendor_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageviewController = PageController();
  int nextPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    //startAutoScroll();

    pageviewController.addListener(() {
      int page = pageviewController.page?.round() ?? 0;
      if (page != nextPage) {
        setState(() {
          nextPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    pageviewController.dispose();
    super.dispose();
  }

  void startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      int nextPage = pageviewController.page!.toInt() + 1;
      if (nextPage >= 2) {
        nextPage = 0;
      }
      pageviewController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }

  Future<void> _markOnboardingAsViewed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
      'hasViewedOnboarding',
      true,
    ); // Mark onboarding as viewed
    print('marked as seen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColors.whiteColor,
      appBar: AppBar(toolbarHeight: 0.001, backgroundColor: kColors.whiteColor),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: wp(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: hp(78),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: PageView(
                controller: pageviewController,
                children: [
                  OnboardingContent(
                    img: kImages.onbod1,
                    title: "WasteWise:\nOur Cleaner Future",
                    highlight: "Future",
                    subTxt:
                        "Experience stress-free waste collection, manage everything from your phone, and support a cleaner, healthier environment.",
                  ),
                  OnboardingContent(
                    img: kImages.onbod2,

                    title: "Save yourself Stress of disposing Waste",
                    highlight: "Stress",
                    subTxt:
                        "Experience stress-free waste collection, manage everything from your phone, and support a cleaner, healthier environment",
                  ),
                  OnboardingContent(
                    img: kImages.onbod3,

                    title: "Be Part of the Change with WasteWise",
                    highlight: "WasteWise",
                    subTxt:
                        "Partner with us to provide sustainable waste services, manage requests, and connect with households and businesses in need of responsible waste collection",
                  ),
                  OnboardingContent(
                    img: kImages.onbod4,

                    title: "Get Started Get Greener",
                    highlight: "Greener",
                    subTxt:
                        "Experience stress-free waste collection, manage everything from your phone, and support a cleaner, healthier environmen",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GenBtn(
            width: 90,
            height: 6,
            btnColor: kColors.primaryColor,
            btnText: 'Waste Disposer',
            txtWeight: FontWeight.w700,
            borderRadius: 40,
            tap: () {
              goTo(context, WasteDisposerSignupScreen());
            },
          ),
          Height(h: 1),
          GenBtn(
            width: 90,
            height: 6,
            btnColor: kColors.lemongreen,
            btnText: 'Waste Vendor',
            txtWeight: FontWeight.w700,
            txtColor: kColors.greenColor,
            borderRadius: 40,
            tap: () {
              goTo(context, WasteVendorSignupScreen());
            },
          ),
          Height(h: 3),
          // LevelProgressButton(
          //   level: nextPage + 1,
          //   onPressed: () async {
          //     final currentPage = pageviewController.page?.round() ?? 0;
          //     final next = currentPage + 1;

          //     if (next >= 3) {
          //       await _markOnboardingAsViewed();
          //       goTo(context, LoginScreen());
          //     } else {
          //       pageviewController.animateToPage(
          //         next,
          //         duration: const Duration(milliseconds: 400),
          //         curve: Curves.easeIn,
          //       );
          //     }

          //     print("Arrow pressed");
          //   },
          // ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

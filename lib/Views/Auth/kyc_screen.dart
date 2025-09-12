import 'package:flutter/material.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/reusables.dart';
import 'package:wastewise/Views/Auth/kyc_document_screen.dart';

class KycScreen extends StatefulWidget {
  const KycScreen({super.key});

  @override
  State<KycScreen> createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: hp(8),

        leading: Row(children: [Width(w: 1), BckBtn()]),
        backgroundColor: kColors.whiteColor,
      ),
      backgroundColor: kColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: wp(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Height(h: 2.5),
              kTxt(
                text: 'Get started with our KYC',
                size: 24,
                weight: FontWeight.w600,
                color: kColors.blackColor,
              ),
              Height(h: 0.3),
              RTxt(
                text: 'Get your account verified to offer trading signals',
                size: 14,
                weight: FontWeight.w400,
                color: kColors.blackColor,
              ),
              Height(h: 5),
              Image.asset(kImages.bicycle),
              Height(h: 10),
              GenBtn(
                width: 90,
                height: 6,
                btnColor: kColors.primaryColor,
                btnText: 'Get Started',
                borderRadius: 30,
                tap: () {
                  goTo(context, KycDocumentScreen());
                },
              ),
              Height(h: 2),
            ],
          ),
        ),
      ),
    );
  }
}

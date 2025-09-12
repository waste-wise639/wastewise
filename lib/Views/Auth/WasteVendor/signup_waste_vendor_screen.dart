import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/custom_textfield.dart';
import 'package:wastewise/Utilities/reusables.dart';
import 'package:wastewise/Views/Auth/WasteDepositor/otp_verification_screen.dart';
import 'package:wastewise/Views/Auth/WasteVendor/waste_vendor_otp_screen.dart';

class WasteVendorSignupScreen extends StatefulWidget {
  const WasteVendorSignupScreen({super.key});

  @override
  State<WasteVendorSignupScreen> createState() =>
      _WasteVendorSignupScreenState();
}

class _WasteVendorSignupScreenState extends State<WasteVendorSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColors.whiteColor,

      appBar: AppBar(
        surfaceTintColor: kColors.whiteColor,
        backgroundColor: kColors.whiteColor,
        automaticallyImplyLeading: true,
        toolbarHeight: hp(4),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: wp(4)),
          child: Column(
            children: [
              Height(h: 3),
              Align(
                alignment: Alignment.centerLeft,

                child: Image.asset(kImages.appicon, height: hp(7)),
              ),
              Height(h: 1.5),
              Row(
                children: [
                  kTxt(
                    text: 'Hello',
                    color: kColors.blackColor,
                    size: 28,
                    weight: FontWeight.w600,
                  ),
                  Width(w: 2),
                  kTxt(
                    text: 'Waste Vendor',
                    color: kColors.greenColor,
                    size: 28,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              Height(h: 1),
              kTxt(
                text:
                    'Join WasteWise today and take the first step towards smarter, eco-friendly waste management. ',
                color: kColors.textGrey,
                size: 14,
                weight: FontWeight.w400,
                maxLine: 4,
              ),
              Height(h: 2),
              Row(
                children: [
                  kTxt(
                    text: 'Already have an account?',
                    color: kColors.blackColor.withOpacity(0.6),
                    size: 14,
                    weight: FontWeight.w600,
                  ),
                  Width(w: 1),
                  kTxt(
                    text: 'Login',
                    color: kColors.greenColor,
                    size: 14,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              Height(h: 3),
              TitleTFieldPref(
                hint: 'Enter full name',
                title: 'Name',
                radius: 10,
                fillColor: kColors.greyWhite.withOpacity(0.4),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset(kImages.usericon),
                ),
                hintSize: 14,
                hintColor: kColors.textGrey,
              ),
              Height(h: 2),
              TitleTFieldPref(
                hint: 'Enter Email address',
                title: 'Email address',
                radius: 10,
                fillColor: kColors.greyWhite.withOpacity(0.4),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset(kImages.emailicon),
                ),
                hintSize: 14,
                hintColor: kColors.textGrey,
              ),
              Height(h: 2),
              TitleTFieldPref(
                hint: 'Enter Password',
                title: 'Password',
                radius: 10,
                fillColor: kColors.greyWhite.withOpacity(0.4),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset(kImages.lockicon),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(kImages.eyeicon),
                ),
                hintSize: 14,
                hintColor: kColors.textGrey,
              ),
              Height(h: 2),
              TitleTFieldPref(
                hint: 'Enter Confirm Password',
                title: 'Confirm Password',
                radius: 10,
                fillColor: kColors.greyWhite.withOpacity(0.4),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset(kImages.lockicon),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(kImages.eyeicon),
                ),
                hintSize: 14,
                hintColor: kColors.textGrey,
              ),
              Height(h: 2),
              TitleTFieldPref(
                hint: 'Enter Referral Code',
                title: 'Referral Code (Optional)',
                radius: 10,
                fillColor: kColors.greyWhite.withOpacity(0.4),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset(kImages.shareicon),
                ),

                hintSize: 14,
                hintColor: kColors.textGrey,
              ),
              Height(h: 4),
              GenBtn(
                width: 90,
                height: 6,
                btnColor: kColors.primaryColor,
                btnText: 'Submit',
                borderRadius: 30,
                tap: () {
                  goTo(context, WasteVendorOtpVerificationScreen());
                },
              ),
              Height(h: 2),
              GenBtnWE(
                width: 90,
                height: 6,
                btnColor: kColors.whiteColor,
                borderColor: kColors.textGrey.withOpacity(0.4),
                btnText: 'Login with Google',
                txtColor: kColors.blackColor,
                borderRadius: 30,
                img: kImages.google,
              ),
              Height(h: 3),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/custom_textfield.dart';
import 'package:wastewise/Utilities/reusables.dart';
import 'package:wastewise/Views/Auth/WasteDepositor/disposer_profile_setup.dart';
import 'package:wastewise/Views/Auth/WasteDepositor/enter_new_pwd_screen.dart';

class ForgotPwdOtpScreen extends StatefulWidget {
  const ForgotPwdOtpScreen({super.key});

  @override
  State<ForgotPwdOtpScreen> createState() => _ForgotPwdOtpScreenState();
}

class _ForgotPwdOtpScreenState extends State<ForgotPwdOtpScreen> {
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
              Align(
                alignment: Alignment.centerLeft,
                child: kTxt(
                  text: 'OTP Verification',
                  color: kColors.blackColor,
                  weight: FontWeight.w600,
                  size: 30,
                ),
              ),
              Height(h: 1),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: wp(85),
                  child: kTxt(
                    text:
                        'Please check your email or phone number for a 6 digit code',
                    color: kColors.textGrey.withOpacity(0.8),
                    weight: FontWeight.w500,
                    maxLine: 5,
                    size: 14,
                  ),
                ),
              ),
              Height(h: 1.5),
              Row(
                children: [
                  kTxt(
                    text: 'Didn\'t get code?',
                    color: kColors.blackColor.withOpacity(0.6),
                    size: 14,
                    weight: FontWeight.w600,
                  ),
                  Width(w: 1),
                  kTxt(
                    text: 'Resend OTP',
                    color: kColors.greenColor,
                    size: 14,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              Height(h: 2),
              TitleTFieldPref(
                hint: 'Enter 6 digits code',
                title: 'OTP',
                radius: 10,
                fillColor: kColors.greyWhite.withOpacity(0.4),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset(kImages.lockicon),
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
                  goTo(context, EnterNewPwdScreen());
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

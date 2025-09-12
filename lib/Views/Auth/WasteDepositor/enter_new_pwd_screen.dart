import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/custom_textfield.dart';
import 'package:wastewise/Utilities/reusables.dart';
import 'package:wastewise/Views/Auth/WasteDepositor/forgot_pwd_otp.dart';
import 'package:wastewise/Views/Auth/WasteDepositor/pwd_reset_success_screen.dart';

class EnterNewPwdScreen extends StatefulWidget {
  const EnterNewPwdScreen({super.key});

  @override
  State<EnterNewPwdScreen> createState() => _EnterNewPwdScreenState();
}

class _EnterNewPwdScreenState extends State<EnterNewPwdScreen> {
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
                  text: 'Reset Password',
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
                    text: 'Please enter and confirm your new password',
                    color: kColors.textGrey.withOpacity(0.8),
                    weight: FontWeight.w500,
                    maxLine: 5,
                    size: 14,
                  ),
                ),
              ),

              Height(h: 6),
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
              Height(h: 4),
              GenBtn(
                width: 90,
                height: 6,
                btnColor: kColors.primaryColor,
                btnText: 'Submit',
                borderRadius: 30,
                tap: () {
                  goTo(context, PwdResetSuccessScreen());
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

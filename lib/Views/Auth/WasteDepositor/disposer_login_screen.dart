import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/custom_textfield.dart';
import 'package:wastewise/Utilities/reusables.dart';
import 'package:wastewise/Views/Auth/WasteDepositor/enter_forgot_pwd_mail.dart';
import 'package:wastewise/Views/Auth/kyc_screen.dart';

class DisposerLoginScreen extends StatefulWidget {
  const DisposerLoginScreen({super.key});

  @override
  State<DisposerLoginScreen> createState() => _DisposerLoginScreenState();
}

class _DisposerLoginScreenState extends State<DisposerLoginScreen> {
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
      body: Padding(
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
                text: 'Waste Disposer Login',
                color: kColors.blackColor,
                size: 28,
                weight: FontWeight.w600,
              ),
            ),
            Height(h: 1),
            RTxt(
              text:
                  'Join WasteWise today and take the first step towards smarter, eco-friendly waste management.',
              color: kColors.textGrey,
              textalign: TextAlign.left,
              weight: FontWeight.w400,
              maxLine: 9,
              size: 13,
            ),
            Height(h: 2),
            Row(
              children: [
                kTxt(
                  text: 'Don\'t have an account?',
                  color: kColors.blackColor.withOpacity(0.6),
                  size: 14,
                  weight: FontWeight.w600,
                ),
                Width(w: 1),
                kTxt(
                  text: 'Create Account',
                  color: kColors.darkGreenColor,
                  size: 14,
                  weight: FontWeight.w600,
                ),
              ],
            ),
            Height(h: 5),
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
              height: hp(6),
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
            Height(h: 0.4),
            GestureDetector(
              onTap: () {
                goTo(context, EnterForgotPwdEmail());
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: kTxt(
                  text: 'Forgot Password?',
                  color: kColors.textGrey,
                  size: 13,
                ),
              ),
            ),
            Height(h: 6),
            GenBtn(
              width: 90,
              height: 6,
              btnColor: kColors.primaryColor,
              btnText: 'Submit',
              borderRadius: 30,
              tap: () {
                goTo(context, KycScreen());
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
    );
  }
}

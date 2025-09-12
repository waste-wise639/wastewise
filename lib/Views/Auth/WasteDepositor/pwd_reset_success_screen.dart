import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/reusables.dart';
import 'package:wastewise/Views/Auth/WasteDepositor/disposer_login_screen.dart';

class PwdResetSuccessScreen extends StatefulWidget {
  const PwdResetSuccessScreen({super.key});

  @override
  State<PwdResetSuccessScreen> createState() => _PwdResetSuccessScreenState();
}

class _PwdResetSuccessScreenState extends State<PwdResetSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColors.whiteColor,
      appBar: AppBar(toolbarHeight: 0.001),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: wp(5)),
        child: Column(
          children: [
            Height(h: 14),
            Image.asset(kImages.pwdimg, height: hp(12)),
            Height(h: 6),
            RTxt(
              text: 'Password Reset Successful',
              color: kColors.blackColor,
              weight: FontWeight.w600,
              size: 20,
            ),
            Height(h: 2),
            RTxt(
              text:
                  'Your password has been updated. You can now log in securely and continue making a positive impact with WasteWise.',
              color: kColors.textGrey,
              textalign: TextAlign.center,
              weight: FontWeight.w400,
              maxLine: 9,
              size: 14,
            ),
            Height(h: 6),
            GenBtn(
              width: 90,
              height: 6,
              btnColor: kColors.primaryColor,
              btnText: 'Proceed to Login',
              borderRadius: 30,
              tap: () {
                goTo(context, DisposerLoginScreen());
              },
            ),
            Height(h: 2),
          ],
        ),
      ),
    );
  }
}

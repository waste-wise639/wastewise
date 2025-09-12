import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/reusables.dart';
import 'package:wastewise/Views/Auth/WasteDepositor/disposer_login_screen.dart';

class AccountCreatedScreen extends StatefulWidget {
  const AccountCreatedScreen({super.key});

  @override
  State<AccountCreatedScreen> createState() => _AccountCreatedScreenState();
}

class _AccountCreatedScreenState extends State<AccountCreatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: kColors.whiteColor,
          appBar: AppBar(toolbarHeight: 0.001),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: wp(5)),
            child: Column(
              children: [
                Height(h: 14),
                Image.asset(kImages.ring, height: hp(26)),
                Height(h: 6),
                RTxt(
                  text: 'Account Created Successfully',
                  color: kColors.blackColor,
                  weight: FontWeight.w600,
                  size: 19,
                ),
                Height(h: 2),
                RTxt(
                  text:
                      'Your WasteWise account is ready! Start exploring your account and take control of waste collection and management today.',
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
        ),
        Positioned(
          top: hp(18),
          left: wp(25),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),

            child: Container(
              height: hp(23.4),
              width: wp(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage(kImages.onbod1),
                  fit: BoxFit.cover,
                ),
              ),
              // child: Image.asset(kImages.onbod1, fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          top: hp(17),
          left: wp(18),
          child: CircleAvatar(
            backgroundColor: kColors.darkGreenColor,
            child: SvgPicture.asset(
              kImages.usericon,
              color: kColors.whiteColor,
            ),
          ),
        ),
        Positioned(
          top: hp(42),
          left: wp(68),
          child: CircleAvatar(
            backgroundColor: kColors.darkGreenColor,
            child: SvgPicture.asset(kImages.mark, color: kColors.whiteColor),
          ),
        ),
      ],
    );
  }
}

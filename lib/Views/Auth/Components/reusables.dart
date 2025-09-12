import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/reusables.dart';

class UploadPicWidget extends StatelessWidget {
  const UploadPicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kTxt(
          text: 'Upload a Picture',
          color: kColors.blackColor,
          size: 14,
          weight: FontWeight.w400,
        ),
        Height(h: 0.6),
        CircleAvatar(
          radius: 34,
          backgroundColor: kColors.textGrey.withOpacity(0.15),
          child: SvgPicture.asset(kImages.usericon, height: hp(3)),
        ),
      ],
    );
  }
}

class KycDocTile extends StatelessWidget {
  KycDocTile({
    super.key,
    required this.sub,
    required this.txt,
    required this.tap,
  });
  String txt, sub;
  Function() tap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                kTxt(
                  text: txt,
                  color: kColors.blackColor,
                  size: 16,
                  weight: FontWeight.w500,
                  maxLine: 1,
                ),
                kTxt(
                  text: sub,
                  color: kColors.textGrey.withOpacity(0.9),
                  size: 13,
                  weight: FontWeight.w400,
                  maxLine: 1,
                ),
              ],
            ),
            CircleAvatar(
              radius: 16,
              backgroundColor: kColors.textGrey.withOpacity(0.1),
              child: Icon(
                Icons.arrow_forward,
                color: kColors.blackColor,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KycDocumetWidget extends StatelessWidget {
  const KycDocumetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hp(4.2),
      width: double.infinity,
      decoration: BoxDecoration(color: kColors.greenColor.withOpacity(0.15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: hp(4),
                width: wp(1),
                color: kColors.primaryColor,
              ),
              Width(w: 3),
              kTxt(
                text: 'Country of verification: Nigeria Only',
                color: kColors.primaryColor.withOpacity(0.8),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: wp(3)),
            child: Image.asset(kImages.nigflag, height: hp(2)),
          ),
        ],
      ),
    );
  }
}

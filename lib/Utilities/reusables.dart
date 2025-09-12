// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wastewise/Utilities/app_colors.dart';

class BckBtn extends StatelessWidget {
  BckBtn({super.key, this.pad});
  double? pad;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () => goBack(context),
      child: Padding(
        padding: EdgeInsets.only(left: (pad ?? 1.3) * size.width / 100),
        child: CircleAvatar(
          backgroundColor: kColors.greenColor.withOpacity(0.1),
          radius: 18,
          child: Icon(
            Icons.arrow_back,
            color: kColors.darkGreenColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}

void goTo(BuildContext context, Widget screen) {
  final random = Random();
  final animations = [
    // _fadeTransition,
    // _scaleTransition,
    _slideTransition, // Added slide transition
  ];
  final randomAnimation = animations[random.nextInt(animations.length)];

  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: randomAnimation,
    ),
  );
}

Widget _slideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  const begin = Offset(1.0, 0.0); // Start from right
  const end = Offset.zero; // End at normal position
  const curve = Curves.easeInOut;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  var offsetAnimation = animation.drive(tween);

  return SlideTransition(position: offsetAnimation, child: child);
}

// Define the goback function
void goBack(BuildContext context) {
  Navigator.pop(context);
}

class Height extends StatelessWidget {
  Height({super.key, required this.h});
  double h;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(height: h * size.height / 100);
  }
}

class Width extends StatelessWidget {
  Width({super.key, required this.w});
  double w;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(width: w * size.width / 100);
  }
}

class kTxt extends StatelessWidget {
  kTxt({
    super.key,
    this.color,
    this.size,
    required this.text,
    this.weight,
    this.textalign,
    this.letterSpace,
    this.maxLine,
    this.softRap,
    this.capitalizeFirst, // New parameter
  });
  String text;
  Color? color;
  double? size, letterSpace;
  TextAlign? textalign;
  FontWeight? weight;
  int? maxLine;
  bool? softRap;
  bool? capitalizeFirst; // New field

  @override
  Widget build(BuildContext context) {
    String displayText = text;

    // Capitalize the first letter if capitalizeFirst is true
    if (capitalizeFirst == true && text.isNotEmpty) {
      displayText = text[0].toUpperCase() + text.substring(1);
    }
    return Text(
      displayText,
      style: GoogleFonts.plusJakartaSans(
        textStyle: TextStyle(
          //fontFamily: 'Rany',
          color: color ?? kColors.whiteColor,
          fontSize: size ?? 14.0,
          fontWeight: weight ?? FontWeight.w400,
          decoration: TextDecoration.none,
          letterSpacing: letterSpace ?? 0,
        ),
      ),
      textAlign: textalign ?? TextAlign.left,
      softWrap: softRap ?? false,
      maxLines: maxLine ?? null,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class RTxt extends StatelessWidget {
  RTxt({
    super.key,
    this.color,
    this.size,
    required this.text,
    this.weight,
    this.textalign,
    this.letterSpace,
    this.maxLine,
    this.softRap,
    s,
  });
  String text;
  Color? color;
  double? size, letterSpace;
  TextAlign? textalign;
  FontWeight? weight;
  int? maxLine;
  bool? softRap;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        fontFamily: 'Rany',
        color: color ?? kColors.whiteColor,
        fontSize: size ?? 14.0,
        fontWeight: weight ?? FontWeight.w400,
        decoration: TextDecoration.none,
        letterSpacing: letterSpace ?? 0,
      ),
      textAlign: textalign ?? TextAlign.left,
      softWrap: softRap ?? false,
      maxLines: maxLine ?? null,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class GenBtn extends StatelessWidget {
  GenBtn({
    super.key,
    required this.width,
    required this.height,
    required this.btnColor,
    this.textSize,
    this.borderColor,
    this.txtColor,
    required this.btnText,
    this.txtWeight,
    this.tap,
    this.borderRadius,
    this.borderWidth,
    this.loadColor,
    this.isLoading,
    this.capitalizeFirst,
  });

  double? textSize, borderRadius, borderWidth;
  double width;
  double height;
  Color? btnColor, txtColor, borderColor, loadColor;
  String btnText;
  FontWeight? txtWeight;
  Function()? tap;
  bool? isLoading, capitalizeFirst;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: tap ?? () {},
      child: Container(
        height: height * size.height / 100,
        width: width * size.width / 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          color: btnColor ?? kColors.whiteColor,
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 1,
          ),
        ),
        child:
            isLoading ?? false
                ? Center(
                  child: SizedBox(
                    height: 2 * size.height / 100,
                    width: 4 * size.width / 100,
                    child: CircularProgressIndicator(
                      color: loadColor ?? kColors.whiteColor,
                    ),
                  ),
                )
                : Center(
                  child: kTxt(
                    capitalizeFirst: capitalizeFirst,
                    text: btnText,
                    size: textSize ?? 14,
                    weight: txtWeight ?? FontWeight.w600,
                    color: txtColor ?? kColors.whiteColor,
                  ),
                ),
      ),
    );
  }
}

class CancelCircle extends StatelessWidget {
  const CancelCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: kColors.whitishGrey,
      child: Icon(Icons.close, color: kColors.blackColor, size: 16),
    );
  }
}

class GenBtnWE extends StatelessWidget {
  GenBtnWE({
    super.key,
    required this.width,
    required this.height,
    required this.btnColor,
    this.textSize,
    this.borderColor,
    this.txtColor,
    required this.btnText,
    this.txtWeight,
    this.tap,
    this.borderRadius,
    this.loadColor,
    this.isLoading,
    required this.img,
    this.imgIcon,
    this.icon,
    this.svged,
    this.svg,
  });

  double? textSize, borderRadius;
  double width;
  double height;
  Color? btnColor, txtColor, borderColor, loadColor;
  String btnText, img;
  String? svg;
  IconData? icon;
  FontWeight? txtWeight;
  Function()? tap;
  bool? isLoading, imgIcon, svged;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: tap ?? () {},
      child: Container(
        height: height * size.height / 100,
        width: width * size.width / 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          color: btnColor ?? kColors.whiteColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child:
            isLoading ?? false
                ? Center(
                  child: SizedBox(
                    height: 2 * size.height / 100,
                    width: 4 * size.width / 100,
                    child: CircularProgressIndicator(
                      color: loadColor ?? kColors.whiteColor,
                    ),
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    imgIcon ?? false
                        ? Icon(icon, color: kColors.whiteColor, size: 16)
                        : svged ?? false
                        ? SvgPicture.asset(svg!)
                        : Image.asset(img, height: 3 * size.height / 100),
                    Width(w: 2),
                    kTxt(
                      text: btnText,
                      size: textSize ?? 14,
                      weight: txtWeight ?? FontWeight.w600,
                      color: txtColor ?? kColors.blackColor,
                    ),
                  ],
                ),
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  MyDivider({super.key, this.color, this.width, this.pad});
  Color? color;
  double? width, pad;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (pad ?? 2) * size.width / 100),
      child: Container(
        height: 0.1 * size.height / 100,
        width: (width ?? 40) * size.width / 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color ?? kColors.whiteColor,
        ),
      ),
    );
  }
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}

// Global shorthand functions
double wp(double percent) => SizeConfig.screenWidth * (percent / 100);
double hp(double percent) => SizeConfig.screenHeight * (percent / 100);

class RowDropDown extends StatelessWidget {
  RowDropDown({
    super.key,
    required this.onTap,
    required this.txt,
    required this.title,
    this.txtColor,
    this.important,
    this.rowWidth,
    this.fillColor,
    this.icon,
    this.hasTitle,
  });

  String txt, title;
  Function() onTap;
  bool? important, hasTitle;
  IconData? icon;
  double? rowWidth;
  Color? txtColor, fillColor;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          hasTitle ?? true
              ? Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 1 * size.width / 100),
                      child: kTxt(
                        text: '$title',
                        weight: FontWeight.w400,
                        size: 14,
                        color: kColors.textGrey,
                      ),
                    ),
                    important ?? false
                        ? kTxt(text: ' *', color: kColors.red)
                        : SizedBox.shrink(),
                  ],
                ),
              )
              : SizedBox.shrink(),
          hasTitle ?? true ? Height(h: 0.4) : SizedBox.shrink(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2 * size.width / 100),
            height: 5.8 * size.height / 100,
            width: 92 * size.width / 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: kColors.whitishGrey, width: 0.1),
              color: fillColor ?? Colors.grey.shade900,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: (rowWidth ?? 74) * size.width / 100,
                  child: kTxt(
                    text: '$txt',
                    maxLine: 1,
                    weight: FontWeight.w600,
                    color: txtColor ?? Colors.black.withOpacity(0.6),
                  ),
                ),
                Icon(
                  icon ?? Icons.expand_more,
                  color: kColors.blackColor,
                  size: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowTxt extends StatelessWidget {
  RowTxt({super.key, required this.lTxt, required this.rTxt});
  String rTxt, lTxt;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: wp(40),
          child: RTxt(
            text: lTxt,
            textalign: TextAlign.left,
            color: kColors.greyWhite.withOpacity(0.6),
            maxLine: 1,
            size: 12,
          ),
        ),
        SizedBox(
          width: wp(50),
          child: RTxt(
            text: rTxt,
            textalign: TextAlign.right,
            color: kColors.whiteColor,
            maxLine: 1,
            size: 14,
          ),
        ),
      ],
    );
  }
}

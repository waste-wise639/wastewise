import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/reusables.dart';

class OnboardingContent extends StatelessWidget {
  OnboardingContent({
    super.key,
    required this.title,
    required this.highlight,
    required this.subTxt,
    required this.img,
  });

  final String title, highlight, subTxt, img;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Height(h: 2),
            Image.asset(img, height: hp(45)),
            Height(h: 6),

            // 🔥 Title with dynamic highlighted word
            SizedBox(
              width: wp(85),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: _buildHighlightedText(
                    title,
                    highlight,
                    GoogleFonts.plusJakartaSans(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: kColors.blackColor,
                    ),
                  ),
                ),
              ),
            ),

            Height(h: 1),

            // Subtitle
            SizedBox(
              width: wp(85),
              child: kTxt(
                text: subTxt,
                textalign: TextAlign.left,
                color: kColors.textGrey,
                maxLine: 100,
                weight: FontWeight.w400,
              ),
            ),
            Height(h: 2),
          ],
        ),
        Positioned(
          top: hp(1.9),
          left: wp(0),

          child: Image.asset(kImages.appicon, height: hp(4.5)),
        ),
      ],
    );
  }

  /// 🟢 Function to build text with highlighted word anywhere
  List<TextSpan> _buildHighlightedText(
    String fullText,
    String highlight,
    TextStyle baseStyle,
  ) {
    List<TextSpan> spans = [];
    int start = 0;

    while (true) {
      int index = fullText.toLowerCase().indexOf(
        highlight.toLowerCase(),
        start,
      );

      if (index < 0) {
        // add remaining normal text
        spans.add(TextSpan(text: fullText.substring(start), style: baseStyle));
        break;
      }

      // normal text before highlight
      if (index > start) {
        spans.add(
          TextSpan(text: fullText.substring(start, index), style: baseStyle),
        );
      }

      // highlighted text
      spans.add(
        TextSpan(
          text: fullText.substring(index, index + highlight.length),
          style: baseStyle.copyWith(color: kColors.greenColor),
        ),
      );

      start = index + highlight.length;
    }

    return spans;
  }
}

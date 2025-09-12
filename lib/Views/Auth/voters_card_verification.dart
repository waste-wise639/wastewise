import 'package:flutter/material.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/custom_textfield.dart';
import 'package:wastewise/Utilities/reusables.dart';
import 'package:wastewise/Views/Auth/Components/upload_img_widget.dart';

class VotersCardVerificationScreen extends StatefulWidget {
  const VotersCardVerificationScreen({super.key});

  @override
  State<VotersCardVerificationScreen> createState() =>
      _VotersCardVerificationScreenState();
}

class _VotersCardVerificationScreenState
    extends State<VotersCardVerificationScreen> {
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
          padding: EdgeInsets.symmetric(horizontal: wp(5)),
          child: Column(
            children: [
              Height(h: 1),
              Align(
                alignment: Alignment.centerLeft,
                child: kTxt(
                  text: 'Voter\'s Card',
                  color: kColors.blackColor,
                  size: 18,
                  weight: FontWeight.w700,
                ),
              ),
              Height(h: 0.6),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: wp(85),
                  child: kTxt(
                    text: 'Provide the following to get verified',
                    color: kColors.textGrey.withOpacity(0.9),
                    weight: FontWeight.w500,
                    maxLine: 5,
                    size: 14,
                  ),
                ),
              ),
              Height(h: 4),
              TitleTField(
                hint: 'Enter Voter\'s card number',
                titleColor: kColors.blackColor.withOpacity(0.8),
                titleSize: 13,
                title: 'Voter\'s ID number',
                titleWeight: FontWeight.w500,
                height: hp(5),
                keyType: TextInputType.number,
                fillColor: kColors.whiteColor,
                elevated: false,
              ),
              Height(h: 5),
              UploadImgWidget(
                txt: 'Upload a copy of the front Page',
                onImageSelected: (file) {
                  if (file != null) {
                    print("✅ Selected image path: ${file.path}");
                  } else {
                    print("🗑️ Image removed");
                  }
                },
              ),
              Height(h: 3),
              UploadImgWidget(
                txt: 'Upload a copy of the rear Page',
                onImageSelected: (file) {
                  if (file != null) {
                    print("✅ Selected image path: ${file.path}");
                  } else {
                    print("🗑️ Image removed");
                  }
                },
              ),

              Height(h: 6),
              GenBtn(
                width: 90,
                height: 6,
                btnColor: kColors.primaryColor,
                btnText: 'Submit',
                borderRadius: 50,
              ),
              Height(h: 2),
            ],
          ),
        ),
      ),
    );
  }
}

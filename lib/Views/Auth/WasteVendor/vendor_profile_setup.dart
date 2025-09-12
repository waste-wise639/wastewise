import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/custom_textfield.dart';
import 'package:wastewise/Utilities/reusables.dart';
import 'package:wastewise/Views/Auth/Components/reusables.dart';
import 'package:wastewise/Views/Auth/WasteDepositor/account_created_screen.dart';
import 'package:wastewise/Views/Auth/WasteVendor/vehicle_details_screen.dart';

class VendorProfileSetup extends StatefulWidget {
  const VendorProfileSetup({super.key});

  @override
  State<VendorProfileSetup> createState() => _VendorProfileSetupState();
}

class _VendorProfileSetupState extends State<VendorProfileSetup> {
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
              child: kTxt(
                text: 'Profile Setup',
                color: kColors.blackColor,
                size: 28,
                weight: FontWeight.w600,
              ),
            ),
            Height(h: 0.6),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: wp(85),
                child: kTxt(
                  text: 'Please complete these form to finish account setup',
                  color: kColors.textGrey.withOpacity(0.8),
                  weight: FontWeight.w500,
                  maxLine: 5,
                  size: 14,
                ),
              ),
            ),
            Height(h: 4),
            Align(alignment: Alignment.centerLeft, child: UploadPicWidget()),
            Height(h: 4),
            TitleTField(
              hint: '  \n   Enter an address',
              hintColor: kColors.blackColor.withOpacity(0.6),
              maxLine: 10,
              height: hp(12),
              fillColor: kColors.greyWhite.withOpacity(0.4),
              radius: 12,
              title: 'Address',
            ),
            Height(h: 4),
            RowDropDown(
              fillColor: kColors.greyWhite.withOpacity(0.4),
              onTap: () {},
              txt: 'Select an Option',
              title: 'Preferred waste Package',
            ),
            Height(h: 3),
            RowDropDown(
              fillColor: kColors.greyWhite.withOpacity(0.4),
              onTap: () {},
              txt: 'Select an Option',
              title: 'Gender',
            ),
            Height(h: 5),
            GenBtn(
              width: 90,
              height: 6,
              btnColor: kColors.primaryColor,
              btnText: 'Submit',
              borderRadius: 30,
              tap: () {
                goTo(context, VehicleDetailScreen());
              },
            ),
            Height(h: 2),
          ],
        ),
      ),
    );
  }
}

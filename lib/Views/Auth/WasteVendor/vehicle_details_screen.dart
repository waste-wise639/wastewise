import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/custom_textfield.dart';
import 'package:wastewise/Utilities/reusables.dart';
import 'package:wastewise/Views/Auth/Components/reusables.dart';
import 'package:wastewise/Views/Auth/WasteDepositor/account_created_screen.dart';
import 'package:wastewise/Views/Auth/WasteVendor/vehicle_detail_updated.dart';

class VehicleDetailScreen extends StatefulWidget {
  const VehicleDetailScreen({super.key});

  @override
  State<VehicleDetailScreen> createState() => _VehicleDetailScreenState();
}

class _VehicleDetailScreenState extends State<VehicleDetailScreen> {
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
                text: 'Vehicle Details',
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
                  text: 'Vehicle information (Type, Plate Number)',
                  color: kColors.textGrey.withOpacity(0.8),
                  weight: FontWeight.w500,
                  maxLine: 5,
                  size: 14,
                ),
              ),
            ),
            Height(h: 4),
            TitleTField(
              hint: 'Enter Plate Number',
              hintColor: kColors.blackColor.withOpacity(0.6),
              fillColor: kColors.greyWhite.withOpacity(0.4),
              radius: 12,
              title: 'Plate Number',
            ),
            Height(h: 2),
            TitleTField(
              hint: 'Enter Proof of Insureance',
              hintColor: kColors.blackColor.withOpacity(0.6),
              fillColor: kColors.greyWhite.withOpacity(0.4),
              radius: 12,
              title: 'Proof of Insurance (Optional)',
            ),
            Height(h: 4),
            TitleTField(
              height: hp(6.3),
              hint: 'Account Name',
              hintColor: kColors.blackColor.withOpacity(0.6),
              fillColor: kColors.greyWhite.withOpacity(0.4),
              radius: 12,
              title: 'Bank Details',
            ),
            TitleTField(
              height: hp(6.3),
              hasTitle: false,
              hint: 'Account Number',
              hintColor: kColors.blackColor.withOpacity(0.6),
              fillColor: kColors.greyWhite.withOpacity(0.4),
              radius: 12,
            ),
            RowDropDown(
              hasTitle: false,
              fillColor: kColors.greyWhite.withOpacity(0.4),
              onTap: () {},
              txt: 'Select a Bank',
              title: 'Gender',
            ),
            Height(h: 10),
            GenBtn(
              width: 90,
              height: 6,
              btnColor: kColors.primaryColor,
              btnText: 'Submit',
              borderRadius: 30,
              tap: () {
                goTo(context, VehicleDetailUpdated());
              },
            ),
            Height(h: 2),
          ],
        ),
      ),
    );
  }
}

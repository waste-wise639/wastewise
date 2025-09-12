import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/reusables.dart';
import 'package:wastewise/Views/Auth/WasteDepositor/disposer_login_screen.dart';
import 'package:wastewise/Views/Auth/WasteVendor/vendor_login_screen.dart';

class VehicleDetailUpdated extends StatefulWidget {
  const VehicleDetailUpdated({super.key});

  @override
  State<VehicleDetailUpdated> createState() => _VehicleDetailUpdatedState();
}

class _VehicleDetailUpdatedState extends State<VehicleDetailUpdated> {
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
              text: 'Vehicle Details Updated',
              color: kColors.blackColor,
              weight: FontWeight.w600,
              size: 20,
            ),
            Height(h: 2),
            RTxt(
              text:
                  'Your vehicle information has been successfully updated. The latest details are now saved to your WasteWise profile for smoother and more reliable operations',
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
                goTo(context, VendorLoginScreen());
              },
            ),
            Height(h: 2),
          ],
        ),
      ),
    );
  }
}

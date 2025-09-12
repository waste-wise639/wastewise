import 'package:flutter/material.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/reusables.dart';
import 'package:wastewise/Views/Auth/Components/reusables.dart';
import 'package:wastewise/Views/Auth/drivers_license_verification.dart';
import 'package:wastewise/Views/Auth/intl_passport_verification_screen.dart';
import 'package:wastewise/Views/Auth/nin_verification_screen.dart';
import 'package:wastewise/Views/Auth/voters_card_verification.dart';

class KycDocumentScreen extends StatefulWidget {
  const KycDocumentScreen({super.key});

  @override
  State<KycDocumentScreen> createState() => _KycDocumentScreenState();
}

class _KycDocumentScreenState extends State<KycDocumentScreen> {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: wp(4)),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Height(h: 2.5),
            kTxt(
              text: 'Choose a KYC document',
              size: 22,
              weight: FontWeight.w600,
              color: kColors.blackColor,
            ),
            Height(h: 0.6),
            KycDocumetWidget(),
            Height(h: 8),
            KycDocTile(
              txt: 'National identity Card (NIMC/NIN Slip)',
              sub: 'Upload copies of your National ID card',
              tap: () {
                goTo(context, NinVerificationScreen());
              },
            ),
            Height(h: 3),
            KycDocTile(
              txt: 'International Passport',
              sub: 'Upload copies of your ID card',
              tap: () {
                goTo(context, InternationalPassportVerificationScreen());
              },
            ),
            Height(h: 3),
            KycDocTile(
              txt: 'Voter\'s',
              sub: 'Upload copies of your Voter\'s Card',
              tap: () {
                goTo(context, VotersCardVerificationScreen());
              },
            ),
            Height(h: 3),
            KycDocTile(
              txt: 'Driver\'s License',
              sub: 'Upload copies of your Driver\'s License',
              tap: () {
                goTo(context, DriverLicenseVerificationScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

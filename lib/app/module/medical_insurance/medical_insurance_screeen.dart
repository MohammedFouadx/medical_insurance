
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';
import 'package:medical_insurance/app/global_widgets/custom_card_icon_text.dart';
import 'package:medical_insurance/app/module/home/widgets/carousel_sliders.dart';
import 'package:medical_insurance/app/module/medical_insurance/insurance_request/insurance_request_screen.dart';
import 'package:medical_insurance/app/services/screen_navigation_service.dart';
import '../home/widgets/home_app_bar.dart';
import 'medical_approvals/medical_approvals_screen.dart';
import 'medical_disclosure/medical_disclosure_screen.dart';


class MedicalInsuranceScreen extends StatelessWidget {
  const MedicalInsuranceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: const HomeAppBar(),
      ),
      body: Padding(
        padding:  EdgeInsets.all(10.0.h),
        child: ListView(
          children: [
            const CarouselSliders(),

            50.ph,
            CustomCardIconText(
              itemsName: "طلب تأمين",
              itemsNameStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold
              ),
              icon: const Icon(
                Icons.add_box_sharp,
                size: 20,
                color: Colors.grey,
              ),
              secondWidget: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey,
              ),
              onTap: () {
                pushScreen(context, const InsuranceRequestScreen());
              },
            ),

            30.ph,
            CustomCardIconText(
              itemsName: "الموافقات الطبية",
              itemsNameStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold
              ),
              icon: const Icon(
                Icons.add_box_sharp,
                size: 20,
                color: Colors.grey,
              ),
              secondWidget: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey,
              ),
              onTap: () {
                pushScreen(context, const MedicalApprovalsScreen());
              },
            ),

            30.ph,
            CustomCardIconText(
              itemsName: "الإفصاح الطبي",
              itemsNameStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold
              ),
              icon: const Icon(
                Icons.add_box_sharp,
                size: 20,
                color: Colors.grey,
              ),
              secondWidget: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey,
              ),
              onTap: () {

                pushScreen(context,  MedicalDisclosureScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

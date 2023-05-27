

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/module/medical_network/medical_network_details.dart';

import '../../global_widgets/custom_card_icon_text.dart';
import '../../services/screen_navigation_service.dart';
import '../home/widgets/home_app_bar.dart';


class MedicalNetworkScreen extends StatelessWidget {
   MedicalNetworkScreen({Key? key}) : super(key: key);


   List<Map<String , dynamic>> medicalNetworkList = [
     {"name" : "مراكز أسنان"},
     {"name" : "مستشفيات"},
     {"name" : "مختبرات"},
     {"name" : "عيادات"},
     {"name" : "صيدليات"},
     {"name" : "مراكز علاج طبيعي"},
     {"name" : "مراكز الصدمات"},
     {"name" : "مراكز أشعة"},
   ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: const HomeAppBar(),
      ),
      body: ListView.builder(
        itemCount: medicalNetworkList.length,
        itemBuilder: (context , index){
          return Padding(
            padding:  EdgeInsets.all(10.0.h),
            child: CustomCardIconText(
                color: Theme.of(context).primaryColor,
                icon: const Icon(
                  Icons.settings_suggest,
                  color: Colors.grey,
                  size: 20,
                ),
                height: 40.h,
                width: 45.w,
                itemsName: medicalNetworkList[index]['name'],
                itemsNameStyle: Theme.of(context).textTheme.bodyText2,
                secondIcon: Icons.arrow_forward_ios,
                secondIconColor: Colors.grey,
                onTap: () {
                  pushScreen(context, const MedicalNetworkDetails());
                }
            ),
          );
        },
      ),
    );
  }
}

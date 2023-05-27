

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';
import 'package:medical_insurance/app/global_widgets/custom_app_bar.dart';
import 'package:medical_insurance/app/module/home/widgets/carousel_sliders.dart';
import 'package:medical_insurance/app/module/home/widgets/home_app_bar.dart';
import 'package:medical_insurance/app/module/home/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: const HomeAppBar(),
      ),
      body: ListView(
        children:   [
          const CarouselSliders(),

           20.ph,
           HomeBody()

        ],
      ),
    );
  }
}

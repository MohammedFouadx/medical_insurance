
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';
import 'package:medical_insurance/app/core/values/app_strings.dart';
import 'package:medical_insurance/app/global_widgets/custom_app_bar.dart';

import '../../core/utils/constants.dart';


class HomeDetailsScreen extends StatelessWidget {
  final String name;
  final String desc;
  final String image;
  const HomeDetailsScreen({
    Key? key,
    required this.name,
    required this.desc,
    required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child:  const CustomAppBar(),
        ),
        body: Padding(
          padding:  EdgeInsets.all(8.0.h),
          child: Container(
            padding: EdgeInsets.all(10.0.h),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppConstants.defaultBorderRadius),
                topRight: Radius.circular(AppConstants.defaultBorderRadius)
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Text(
                  name.toString(),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),

                10.ph,

                Text(
                  desc,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

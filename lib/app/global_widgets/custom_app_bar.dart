import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';

import '../core/values/app_images.dart';
import '../core/values/app_strings.dart';


class CustomAppBar extends StatelessWidget {

  const CustomAppBar({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Theme.of(context).selectedRowColor, // black color
      child: Column(
        children: [
          // app header
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0.w , vertical: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  AppStrings.appName,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    color: Colors.white
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                   Navigator.pop(context);
                  },
                  child:  Padding(
                    padding:   EdgeInsets.only(left: 10.0.w , right: 10.0.w),
                    child:  const Icon(
                       Icons.arrow_forward_ios,
                      color: Colors.white, // white color
                      size: 25,
                    ),
                  ),
                ),






              ],
            ),
          ),


        ],
      ),
    );
  }
}

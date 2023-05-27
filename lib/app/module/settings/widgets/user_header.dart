
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';

import '../../../core/values/app_images.dart';


class UserHeader extends StatelessWidget {
  const UserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: Container(
            height: 100.h,
            width: 100.w,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(3.0.h),
            child: Image.asset(
                AppImages.logo
            ),
          ),
        ),
        20.ph,
        Center(
          child: Text(
            "مرحباً بك",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
  }
}

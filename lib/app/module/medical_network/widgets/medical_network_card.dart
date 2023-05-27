
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/constants.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';


class MedicalNetworkCard extends StatelessWidget {

  final Widget? icon;
  final Widget ratingWidget;
  final String itemsName;
  final String? subItemsName;
  final GestureTapCallback? onTap;
  final double? height;
  final double? width;
  final Color? color;
  final Color? iconColor;
  final Color? backIconColor;
  final TextStyle? itemsNameStyle;
  final TextStyle? subItemsNameStyle;
  final BorderRadiusGeometry? borderRadius;


  const MedicalNetworkCard({
    Key? key,
    this.icon,
    required this.ratingWidget,
    required this.itemsName,
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.iconColor,
    this.backIconColor,
    this.itemsNameStyle,
    this.borderRadius,
    this.subItemsName,
    this.subItemsNameStyle
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
        color: Theme.of(context).primaryColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start ,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height ?? 45.h,
            width: width ??  50.w,
            decoration: BoxDecoration(
              color: backIconColor ??  Theme.of(context).primaryColorLight,
              borderRadius:  BorderRadius.circular(8.0),
            ),
            child: icon,
          ),
          20.pw,


           Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemsName,
                style: itemsNameStyle ?? Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.bold
                ),
              ),

              5.ph,
              ratingWidget,
              5.ph,
              SizedBox(
                width: 150.w,
                child: Text(
                    subItemsName!,
                    maxLines: 2,
                    style: subItemsNameStyle ??  Theme.of(context).textTheme.caption
                ),
              ),
            ],
          ),


          const Spacer(),

          Container(
            height: 30.h,
            width: 50.w,
            margin:  EdgeInsets.symmetric(horizontal: 5.w),
            padding: EdgeInsets.all(5.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                color: Colors.grey[300]
            ),
            child: Center(
              child: Text(
                "تقييم",
                style: Theme.of(context).textTheme.caption!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]

                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

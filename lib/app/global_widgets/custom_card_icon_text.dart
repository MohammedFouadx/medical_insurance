

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';

class CustomCardIconText extends StatelessWidget {

  final Widget? icon;
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
  final IconData? secondIcon;
  final Color? secondIconColor;
  final Widget? secondWidget;
  final BorderRadiusGeometry? borderRadius;

  const CustomCardIconText({
    Key? key,
    this.icon,
    required this.itemsName,
     this.onTap,
    this.height,
    this.width,
    this.color,
    this.iconColor,
    this.backIconColor,
    this.itemsNameStyle,
    this.secondIcon,
    this.secondIconColor,
    this.secondWidget,
    this.borderRadius,
    this.subItemsName,
    this.subItemsNameStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
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


            subItemsName == null
            ?  Text(
              itemsName,
              style: itemsNameStyle ?? Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.bold
              ),
            )
            : Column(
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

            secondWidget == null
                ? Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Icon(
                secondIcon,
                size: 20,
                color: secondIconColor ??  Theme.of(context).secondaryHeaderColor,
              ),
            )
                : Container(
                  margin:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: secondWidget!,
                ),

          ],
        ),
      ),
    );
  }
}

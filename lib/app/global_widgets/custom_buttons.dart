

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButtons extends StatelessWidget {
  final double? width;
  final double? height;
  final Color buttonColor;
  final TextStyle? textStyle;
  final String text;
  final Widget? textWidget;
  final GestureTapCallback? onTap;
  const CustomButtons({
    Key? key,
    required this.text,
    required this.buttonColor,
     this.textStyle,
    this.width,
    this.height,
    this.onTap,
    this.textWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? 40.h ,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8.0)
        ),

        child: Center(
          child: textWidget ?? Text(
            text,
            style: textStyle ?? Theme.of(context).textTheme.headline1!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp
            ),
          ),
        ),
      ),
    );
  }
}

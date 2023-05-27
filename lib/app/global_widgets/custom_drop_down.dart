

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {

  final List<DropdownMenuItem<String>> listItem;
  final String value;
  final String hintText;
  final ValueChanged onChanged;
  final double? height;
  final Color? fillColor;
  const CustomDropDown({
    Key? key,
    required this.listItem,
    required this.value,
    required this.hintText,
    required this.onChanged,
    this.height,
    this.fillColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: height ?? 50.h,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey[300]!),
              color: fillColor ?? Theme.of(context).backgroundColor
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 5.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isDense: true,
                itemHeight: null,
                items: listItem,
                onChanged: onChanged,
                dropdownColor: Theme.of(context).backgroundColor,
                isExpanded: true,
                style: Theme.of(context).textTheme.caption,
                value: value,
                hint: Text(
                  hintText,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.caption,
                )
              ),
            ),
          )

      ),
    );
  }
}

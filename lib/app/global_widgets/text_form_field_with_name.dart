

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';

import 'custom_text_form_field.dart';



class TextFormFieldWithName extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String hintTextFormField;
  final String fieldName;
  final FormFieldValidator? validator;
  final GestureTapCallback? onFieldSubmitted;
  final bool? readOnly;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? inputBorder;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? fieldNameStyle;
  final TextStyle? textStyle;
  final String? initialValue;
  final int? maxLines;
  final Widget? fieldRequired;
  final ValueChanged<String>? onChanged;
  final TextDirection? textDirection;
  const TextFormFieldWithName({
    Key? key,
     this.controller,
     this.keyboardType,
     this.textInputAction,
    required this.hintTextFormField,
    required this.fieldName,
     this.validator,
     this.onFieldSubmitted,
    this.readOnly,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.inputBorder,
    this.contentPadding,
    this.fieldNameStyle,
    this.initialValue,
    this.maxLines,
    this.fieldRequired,
    this.textStyle,
    this.onChanged,
    this.textDirection
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             fieldName,
              style: fieldNameStyle ?? Theme.of(context).textTheme.bodyText2,
            ),
            10.pw,
            fieldRequired ?? 0.ph
          ],
        ),
        10.ph,
        CustomTextFormField(
            maxLines: maxLines ?? 1,
            controller: controller!,
            textDirection: textDirection,
            initialValue: initialValue,
            keyboardType: keyboardType!,
            textInputAction: textInputAction!,
            hintText: hintTextFormField,
            validator: validator,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            textStyle: textStyle,
            readOnly: readOnly ?? false,
            obscureText: obscureText ?? false,
            suffixIcon: suffixIcon,
            decoration: InputDecoration(
            hintText: hintTextFormField,
            hintStyle:  Theme.of(context).textTheme.caption!.copyWith(
              fontFamily: "cairo"
            ),
            contentPadding: contentPadding ??  EdgeInsets.symmetric(vertical: 5.h , horizontal: 10.w),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            fillColor: Theme.of(context).primaryColor,
            filled: true,
            enabled: true,
            alignLabelWithHint: false,
            border:  inputBorder ?? OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            enabledBorder:  inputBorder ?? OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey[400]!, width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey[400]!, width: 0),
            ),
          ),


        )
      ],
    );
  }
}

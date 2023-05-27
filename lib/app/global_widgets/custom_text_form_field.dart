
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {

  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextStyle? textStyle;
  final bool autofocus;
  final bool obscureText ;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final GestureTapCallback? onFieldSubmitted;
  final FormFieldValidator? validator;
  final Function? onSave;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode autoValidateMode;
  final String  hintText;
  final TextStyle?  hintStyle;
  final InputBorder? inputBorder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? height ;
  final double? width;
  final bool? readOnly;
  final InputDecoration? decoration;
  final Color? fillColor;
  final String? initialValue;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final TextDirection? textDirection;
  final String? label;



  const CustomTextFormField({
    Key? key,
     this.controller,
    required this.keyboardType,
    required this.textInputAction,
    this.textStyle,
    this.autofocus = false,
    this.obscureText = false,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.validator,
    this.onSave,
    this.inputFormatters,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.inputBorder,
    required this.hintText,
     this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.height,
    this.readOnly,
    this.decoration,
    this.fillColor,
    this.initialValue,
    this.maxLines,
    this.contentPadding,
    this.textDirection,
    this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: controller,
      textDirection: textDirection,
      initialValue: initialValue,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: textStyle,
      autofocus: autofocus,
      obscureText: obscureText,
      readOnly: readOnly ?? false,
      obscuringCharacter: "*",
      onChanged:  onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: (value) => onFieldSubmitted,
      validator:  validator,
      onSaved: (save) => onSave,
      inputFormatters: inputFormatters,
      autovalidateMode: autoValidateMode,
      decoration: decoration ?? InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? Theme.of(context).textTheme.caption!.copyWith(

        ),
        contentPadding: contentPadding ??  EdgeInsets.symmetric(vertical: 20.h , horizontal: 10.w),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        label: label != null ?  Text(label.toString()) : null,
        fillColor: fillColor ?? Theme.of(context).primaryColor,
        filled: true,
        enabled: true,
        border:  inputBorder ?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder:  inputBorder ?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey[400]!, width: 0),
        ),
        focusedBorder: inputBorder ??  OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey[400]!, width: 0),
        ),
      ),






    );
  }
}

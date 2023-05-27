
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/constants.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';
import 'package:medical_insurance/app/global_widgets/custom_app_bar.dart';
import 'package:medical_insurance/app/global_widgets/custom_text_form_field.dart';

import '../../global_widgets/custom_buttons.dart';
import '../../global_widgets/text_form_field_with_name.dart';

class SuggestionsScreen extends StatefulWidget {
  const SuggestionsScreen({Key? key}) : super(key: key);

  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {

  final TextEditingController noteController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: const CustomAppBar(),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding:  EdgeInsets.all(10.0.h),
            child: ListView(

              children: [




                /// note
                Container(
                  padding: EdgeInsets.all(10.0.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ملاحظاتك مهمة بالنسبة لنا",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      10.ph,


                      CustomTextFormField(
                        maxLines: 5,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        hintText: "اترك ملاحظاتك هنا",
                        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontFamily: "cairo"
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 20.h , horizontal: 10.w),
                        validator: (value){
                          if (value.length == 0) {
                            return "هذا الحقل إجباري";
                          }
                          return null;
                        },
                        onFieldSubmitted: (){
                          FocusScope.of(context).nextFocus();
                        },
                      ),

                    ],
                  ),
                ),


                20.ph,
                /// contact
                Container(
                  padding: EdgeInsets.all(10.0.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "للإتصال بك",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      10.ph,


                      CustomTextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        hintText: "بريدك الإلكتروني",
                        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontFamily: "cairo"
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 10.w),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        validator: (value){
                          if (value.length == 0) {
                            return "هذا الحقل إجباري";
                          }
                          return null;
                        },
                        onFieldSubmitted: (){
                          FocusScope.of(context).nextFocus();
                        },
                      ),


                      20.ph,

                      CustomTextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        hintText: "الرقم",
                        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontFamily: "cairo"
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 10.w),
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.grey,
                        ),
                        validator: (value){
                          if (value.length == 0) {
                            return "هذا الحقل إجباري";
                          }
                          return null;
                        },
                        onFieldSubmitted: (){
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                    ],
                  ),
                ),


                40.ph,
                /// send
                CustomButtons(
                  text: "إرسال",
                  buttonColor: Theme.of(context).secondaryHeaderColor,
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

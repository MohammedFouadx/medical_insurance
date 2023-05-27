

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';

import '../../../core/utils/constants.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../../../global_widgets/custom_buttons.dart';
import '../../../global_widgets/text_form_field_with_name.dart';

class MedicalApprovalsScreen extends StatefulWidget {
  const MedicalApprovalsScreen({Key? key}) : super(key: key);

  @override
  State<MedicalApprovalsScreen> createState() => _MedicalApprovalsScreenState();
}

class _MedicalApprovalsScreenState extends State<MedicalApprovalsScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController requestController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    requestController.dispose();
  }



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

                Text(
                  "الموافقات الطبية",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp
                  ),
                ),

                20.ph,
                Container(
                  padding: EdgeInsets.all(10.0.h),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppConstants.defaultBorderRadius),
                        topRight: Radius.circular(AppConstants.defaultBorderRadius)
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// name
                      TextFormFieldWithName(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        hintTextFormField: "الإسم",
                        fieldName: "اسم مقدم الطلب",
                        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontFamily: "cairo"
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
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

                      /// phone
                      TextFormFieldWithName(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        hintTextFormField: "رقم الهاتف",
                        fieldName: "رقم الهاتف",
                        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontFamily: "cairo"
                        ),
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

                      20.ph,


                      /// request
                      TextFormFieldWithName(
                        maxLines: 5,
                        controller: requestController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        hintTextFormField: "تفاصيل الطلب",
                        fieldName: "الطلب",
                        contentPadding: EdgeInsets.symmetric(vertical: 20.h , horizontal: 10.w),
                        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontFamily: "cairo"
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

                      40.ph,
                      /// send
                      CustomButtons(
                        text: "إرسال",
                        buttonColor: Theme.of(context).secondaryHeaderColor,
                      )
                    ],
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

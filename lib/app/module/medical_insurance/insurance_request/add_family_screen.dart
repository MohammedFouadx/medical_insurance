

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';

import '../../../core/utils/constants.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../../../global_widgets/custom_buttons.dart';
import '../../../global_widgets/custom_drop_down.dart';
import '../../../global_widgets/text_form_field_with_name.dart';
import '../../../services/screen_navigation_service.dart';
import 'model/insurance_request_controller.dart';


class AddFamilyScreen extends StatefulWidget {
  const AddFamilyScreen({Key? key}) : super(key: key);

  @override
  State<AddFamilyScreen> createState() => _AddFamilyScreenState();
}

class _AddFamilyScreenState extends State<AddFamilyScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController idCardController = TextEditingController();

  InsuranceRequestController maritalStatusController = InsuranceRequestController();
  String  currentRelation = "الام";

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    dateController.dispose();
    idCardController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    maritalStatusController.getRelationShips(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor:  Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: const CustomAppBar(),
        ),
        body: Directionality(
          textDirection : TextDirection.rtl,
          child: Padding(
            padding:  EdgeInsets.all(10.0.h),
            child: ListView(
              children: [

                Text(
                  "عائلة الموظف",
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
                        fieldName: "الإسم",
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

                      /// id card
                      TextFormFieldWithName(
                        controller: idCardController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        hintTextFormField: "00000000000000",
                        fieldName: "البطاقة الشخصية",
                        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontFamily: "cairo"
                        ),
                        prefixIcon: const Icon(
                          Icons.credit_card,
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

                      /// date
                      TextFormFieldWithName(
                        controller: dateController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        hintTextFormField: "1-1-2020",
                        fieldName: "تاريخ الميلاد",
                        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontFamily: "cairo"
                        ),
                        prefixIcon: const Icon(
                          Icons.date_range,
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
                        hintTextFormField: "الرقم",
                        fieldName: "الرقم",
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

                      /// address
                      TextFormFieldWithName(
                        controller: addressController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        hintTextFormField: "العنوان",
                        fieldName: "العنوان",
                        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontFamily: "cairo"
                        ),
                        prefixIcon: const Icon(
                          Icons.location_city,
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










                      /// relation

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "صلة القرابة",
                            style:  Theme.of(context).textTheme.bodyText2,
                          ),
                          10.ph,
                          CustomDropDown(
                              height: 40.h,
                              listItem:  maritalStatusController.relationshipsItems,
                              value: currentRelation,
                              hintText: "الام",
                              fillColor: Theme.of(context).primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  currentRelation = value;
                                });
                              }
                          ),
                        ],
                      ),

                      40.ph,

                      /// send
                      CustomButtons(
                        text: "إرسال",
                        buttonColor: Theme.of(context).secondaryHeaderColor,
                      )



                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

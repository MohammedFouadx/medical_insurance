
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_insurance/app/core/utils/constants.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';
import 'package:medical_insurance/app/global_widgets/custom_app_bar.dart';
import 'package:medical_insurance/app/global_widgets/custom_buttons.dart';
import 'package:medical_insurance/app/module/medical_insurance/insurance_request/add_family_screen.dart';
import 'package:medical_insurance/app/services/screen_navigation_service.dart';
import 'package:path/path.dart' as p;
import '../../../global_widgets/custom_drop_down.dart';
import '../../../global_widgets/custom_sliding_panel.dart';
import '../../../global_widgets/custom_two_text.dart';
import '../../../global_widgets/text_form_field_with_name.dart';
import 'model/insurance_request_controller.dart';


class InsuranceRequestScreen extends StatefulWidget {
  const InsuranceRequestScreen({Key? key}) : super(key: key);

  @override
  State<InsuranceRequestScreen> createState() => _InsuranceRequestScreenState();
}

class _InsuranceRequestScreenState extends State<InsuranceRequestScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController idCardController = TextEditingController();
  final TextEditingController jopController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  bool _isHidden2 = true;
  InsuranceRequestController maritalStatusController = InsuranceRequestController();
  String  currentMaritalStatus = "مزوج";

  File? _image;
  String? imageName;

  Future getImageFromCamera() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
      imageName = p.basename(_image!.path);
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
      imageName = p.basename(_image!.path);
    });
  }


  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dateController.dispose();
    genderController.dispose();
    idCardController.dispose();
    jopController.dispose();
    companyNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    maritalStatusController.getMaritalStatus(context);
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
              children:   [

                /// note text
                Container(
                  height: 60.h,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.0.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                    color: Theme.of(context).accentColor
                  ),
                  child: Text(
                      "تنبية: \n يرجى تعبئة البيانات المطلوبة بشكل صحيح",
                    style: Theme.of(context).textTheme.bodyText1,
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

                      /// email
                      TextFormFieldWithName(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        hintTextFormField: "الإيميل",
                        fieldName: "الإيميل",
                        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontFamily: "cairo"
                        ),
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

                      /// password
                      TextFormFieldWithName(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        hintTextFormField: "إدخل كلمة المرور",
                        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontFamily: "cairo"
                        ),
                        obscureText : _isHidden2,
                        fieldName: "كلمة المرور",
                        suffixIcon: InkWell(
                          onTap: _toggleNewPasswordView,
                          child: Icon(
                            _isHidden2
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20,
                            color: Colors.grey, // black color
                          ),
                        ),
                        validator: (value){
                          if (value.length == 0) {
                            return "هذا الحقل إجباري";
                          }
                          return null;
                        },
                        onFieldSubmitted: (){
                          FocusScope.of(context).unfocus();
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

                      /// gender
                      TextFormFieldWithName(
                        controller: genderController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        hintTextFormField: "ذكر - أنثى",
                        fieldName: "الجنس",
                        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontFamily: "cairo"
                        ),
                        prefixIcon: const Icon(
                          Icons.person_add,
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

                      /// image

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "إختر صورة",
                            textAlign: TextAlign.right,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),

                          10.ph,

                          InkWell(
                            onTap: () async{
                              await  showModalBottomSheet(
                                  context: context,
                                  elevation: 0.3,
                                  isScrollControlled: true,
                                  enableDrag: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(8.0)
                                    ),
                                  ),
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context , mySetState){
                                        return Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Wrap(
                                            crossAxisAlignment: WrapCrossAlignment.start,
                                            runSpacing: 10.0.h,
                                            runAlignment: WrapAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10.0),
                                                child: CustomTowText(
                                                  title: "إختر صورة",
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  titleStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 22.sp

                                                  ),
                                                  subWidget: Padding(
                                                    padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
                                                    child: InkWell(
                                                      onTap: (){
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Icon(
                                                        Icons.close,
                                                        size: 30,
                                                        color: Theme.of(context).secondaryHeaderColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              3.ph,
                                              Text(
                                                "قم با ختيار صورة من المعرض أو قم بفتح الكاميرا",
                                                style: Theme.of(context).textTheme.caption!.copyWith(
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              20.ph,

                                              CustomSlidingPanel(
                                                onTapCamera: () {
                                                  getImageFromCamera();
                                                },
                                                onTapGallery: () {
                                                  getImageFromGallery();
                                                },
                                              ),

                                              20.ph,

                                              CustomButtons(
                                                height: 40.h,
                                                text: "حفظ",
                                                buttonColor: Theme.of(context).secondaryHeaderColor,
                                                onTap: (){
                                                  Navigator.of(context).pop();
                                                },
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  });
                            },
                            child: Container(
                              height: 40.h,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 10.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                                border: Border.all(color: Colors.grey[300]!)
                              ),
                              child: Text(
                                "إختر صورة",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ),
                        ],
                      ),

                      10.ph,


                      _image == null
                          ? 0.ph
                          : SizedBox(
                        height: 200.h,
                        width: MediaQuery.of(context).size.width,
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
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

                      /// jop
                      TextFormFieldWithName(
                        controller: jopController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        hintTextFormField: "طالب",
                        fieldName: "الوظيفة",
                        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontFamily: "cairo"
                        ),
                        prefixIcon: const Icon(
                          Icons.work,
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

                      /// company name
                      TextFormFieldWithName(
                        controller: companyNameController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        hintTextFormField: "إسم الشركة",
                        fieldName: "إسم الشركة",
                        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontFamily: "cairo"
                        ),
                        prefixIcon: const Icon(
                          Icons.computer,
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

                      /// marital status

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "الحالة الإجتماعية",
                            style:  Theme.of(context).textTheme.bodyText2,
                          ),
                          10.ph,
                          CustomDropDown(
                              height: 40.h,
                              listItem:  maritalStatusController.maritalStatusItems,
                              value: currentMaritalStatus,
                              hintText: "مزوج",
                              fillColor: Theme.of(context).primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  currentMaritalStatus = value;
                                });
                              }
                          ),
                        ],
                      ),

                      40.ph,

                      /// buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// add family
                          Expanded(
                            child: CustomButtons(
                              text: "إضافة العائلة",
                              buttonColor: Theme.of(context).secondaryHeaderColor,
                              onTap: () {

                                pushScreen(context, const AddFamilyScreen());
                              },
                            ),
                          ),

                          10.pw,

                          /// send
                          Expanded(
                            child: CustomButtons(
                              text: "إرسال",
                              buttonColor: Theme.of(context).secondaryHeaderColor,
                            ),
                          )
                        ],
                      ),



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
  void _toggleNewPasswordView() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }
}

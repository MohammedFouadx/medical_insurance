

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';

import '../../../core/utils/constants.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../../../global_widgets/custom_buttons.dart';
import '../../../global_widgets/custom_drop_down.dart';
import '../../../global_widgets/custom_sliding_panel.dart';
import '../../../global_widgets/custom_two_text.dart';
import '../../../global_widgets/text_form_field_with_name.dart';
import 'model/insurance_request_controller.dart';
import 'package:path/path.dart' as p;

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
                          )
                        ],
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

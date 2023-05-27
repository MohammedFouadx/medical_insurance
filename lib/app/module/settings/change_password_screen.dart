

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';
import 'package:medical_insurance/app/global_widgets/custom_app_bar.dart';
import 'package:medical_insurance/app/module/settings/widgets/user_header.dart';

import '../../global_widgets/custom_buttons.dart';
import '../../global_widgets/text_form_field_with_name.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  bool _isHidden2 = true;
  bool _isHidden3 = true;

  @override
  void dispose() {
    super.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
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
        body: GestureDetector(
          onTap: (){
            return FocusScope.of(context).unfocus();
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      20.ph,
                      const UserHeader(),

                      20.ph,

                      Container(
                          padding: const EdgeInsets.all(10.0),
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:  const BorderRadius.only(
                                  topRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0)
                              )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [

                              /// current password
                              TextFormFieldWithName(
                                controller: currentPasswordController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                hintTextFormField:  "ادخل كلمة المرور الحالية",
                                fieldName: "كلمة المرور الحالية",
                                obscureText: _isHidden,
                                suffixIcon: InkWell(
                                  onTap: _toggleCurrentPasswordView,
                                  child: Icon(
                                    _isHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20,
                                    color: Theme.of(context).secondaryHeaderColor, // black color
                                  ),
                                ),
                                onFieldSubmitted: (){
                                  FocusScope.of(context).nextFocus();
                                },
                              ),
                              20.ph,

                              /// new password
                              TextFormFieldWithName(
                                controller: newPasswordController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                hintTextFormField:  "ادخل كلمة المرور الجديدة",
                                fieldName: "كلمة المرور الجديدة",
                                obscureText: _isHidden2,
                                suffixIcon: InkWell(
                                  onTap: _toggleNewPasswordView,
                                  child: Icon(
                                    _isHidden2
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20,
                                    color: Theme.of(context).secondaryHeaderColor, // black color
                                  ),
                                ),
                                onFieldSubmitted: (){
                                  FocusScope.of(context).nextFocus();
                                },
                              ),
                              20.ph,


                              /// confirm password
                              TextFormFieldWithName(
                                controller: confirmPasswordController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                hintTextFormField:  "اعد كتابة كلمة المرور",
                                fieldName: "تاكيد كلمة المرور",
                                obscureText: _isHidden3,
                                suffixIcon: InkWell(
                                  onTap: _toggleConfirmPasswordView,
                                  child: Icon(
                                    _isHidden3
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20,
                                    color: Theme.of(context).secondaryHeaderColor, // black color
                                  ),
                                ),
                                onFieldSubmitted: (){
                                  FocusScope.of(context).unfocus();
                                },
                              ),

                              40.ph,

                              CustomButtons(
                                width: 100.w,
                                height: 45.h,
                                text: "حفظ",
                                buttonColor:  Theme.of(context).secondaryHeaderColor,
                                onTap: () {},

                              ),



                            ],
                          )
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _toggleCurrentPasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }


  void _toggleNewPasswordView() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }

  void _toggleConfirmPasswordView() {
    setState(() {
      _isHidden3 = !_isHidden3;
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';
import '../../../global_widgets/custom_buttons.dart';
import '../../../global_widgets/text_form_field_with_name.dart';



String gender = "man";
class SignUpTab extends StatefulWidget {

  const SignUpTab({
    Key? key,

  }) : super(key: key);

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  late TextEditingController emailController;
  late TextEditingController userNameController;
  late TextEditingController passwordController ;
  late TextEditingController confirmPasswordController ;
  GlobalKey<FormState> _formKey = GlobalKey();
  String? chosenValue;
  bool _isHidden = true;
  bool isLoading = false;





  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    userNameController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }


  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
    userNameController.dispose();
    confirmPasswordController.dispose();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding:  EdgeInsets.all(10.0.h),
          child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                primary: false,
                children: [


                  /// user name
                  TextFormFieldWithName(
                    controller: userNameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintTextFormField: "أدخل إسم المستخدم",
                    fieldName:"إسم المستخدم",
                    fieldRequired: const Icon(
                      CupertinoIcons.staroflife_fill,
                      color: Colors.red,
                      size: 10,
                    ),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    onFieldSubmitted: (){
                      FocusScope.of(context).nextFocus();
                    },
                    validator: (v) {
                      if (v.length == 0) {
                        return "أدخل إسم المستخدم";
                      }
                      return null;
                    },

                  ),


                  15.ph,

                  /// email
                  TextFormFieldWithName(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hintTextFormField: "أدخل الإيميل",
                    fieldName: "الإيميل",
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    onFieldSubmitted: (){
                      FocusScope.of(context).nextFocus();
                    },
                  ),



                  15.ph,



                  /// password

                  TextFormFieldWithName(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    hintTextFormField: "إدخل كلمة المرور",
                    fieldName: "كلمة المرور",
                    fieldRequired: const Icon(
                      CupertinoIcons.staroflife_fill,
                      color: Colors.red,
                      size: 10,
                    ),
                    textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontFamily: "cairo"
                    ),
                    obscureText: _isHidden,
                    suffixIcon: InkWell(
                      onTap: _toggleCurrentPasswordView,
                      child: Icon(
                        _isHidden
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 20,
                        color: Colors.grey, // black color
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    onFieldSubmitted: (){
                      FocusScope.of(context).nextFocus();
                    },
                    validator: (v) {

                      if (v.length == 0) {
                        return "إدخل كلمة المرور";
                      }

                      return null;
                    },
                  ),

                  15.ph,

                  /// confirm password
                  TextFormFieldWithName(
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    hintTextFormField: "قم بتاكيد كلمة المرور",
                    fieldName: "تاكيد كلمة المرور",
                    textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontFamily: "cairo"
                    ),
                    fieldRequired: const Icon(
                      CupertinoIcons.staroflife_fill,
                      color: Colors.red,
                      size: 10,
                    ),
                    obscureText: _isHidden,
                    suffixIcon: InkWell(
                      onTap: _toggleCurrentPasswordView,
                      child: Icon(
                        _isHidden
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 20,
                        color: Colors.grey, // black color
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    onFieldSubmitted: (){
                      FocusScope.of(context).unfocus();
                    },
                    validator: (v) {

                      if (v.length == 0) {
                        return "هذا الحقل إجباري";
                      }
                      if (v != passwordController.text) {
                        return "لايوجد تطابق";
                      }
                      return null;
                    },
                  ),

                  20.ph,

                  /// create account button
                  CustomButtons(
                    height: 45.h,
                    text: "إنشاء حساب",
                    textStyle: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 16.sp
                    ),
                    buttonColor:  Theme.of(context).secondaryHeaderColor,
                    onTap: () {},
                  )
                ],
              )
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



}



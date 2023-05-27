
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';
import 'package:medical_insurance/app/module/start/start.dart';

import '../../../global_widgets/custom_buttons.dart';
import '../../../global_widgets/text_form_field_with_name.dart';





class SignInTab extends StatefulWidget {
  const SignInTab({Key? key}) : super(key: key);

  @override
  State<SignInTab> createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab> {
  late TextEditingController nameController ;
  late TextEditingController passwordController ;
  GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;
  var userStatus;
  String initialCountry = 'AE';
  String dialCode = '+971';
  String? numberCode;
  bool _isHidden2 = true;


  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    passwordController = TextEditingController();
  }




  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {




    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding:  EdgeInsets.all(10.0.h),
        child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: <Widget>[


                /// user name
                TextFormFieldWithName(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hintTextFormField: "أدخل إسم المستخدم",
                  fieldName: "إسم المستخدم",
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

                /// login button
                CustomButtons(
                  height: 45.h,
                  text: "تسجيل الدخول",
                  textStyle: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 16.sp
                  ),
                  buttonColor:  Theme.of(context).secondaryHeaderColor,
                  onTap: () {
                    Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const StartScreen()));
                  }
                ),

                40.ph,



              ],
            )),
      ),
    );

  }
  void _toggleNewPasswordView() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }


}

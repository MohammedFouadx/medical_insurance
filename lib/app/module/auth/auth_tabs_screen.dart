import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';
import 'package:medical_insurance/app/module/auth/sign_in/sign_in_tab.dart';
import 'package:medical_insurance/app/module/auth/sign_up/sign_up_tab.dart';

import '../../core/values/app_images.dart';


class AuthTabsScreen extends StatefulWidget {
  const AuthTabsScreen({Key? key}) : super(key: key);

  @override
  State<AuthTabsScreen> createState() => _AuthTabsScreenState();
}

class _AuthTabsScreenState extends State<AuthTabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
            body: GestureDetector(
              onTap: (){
                return FocusScope.of(context).unfocus();
              },
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView(
             children: [
                Container(
                  height: 300.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.logo), fit: BoxFit.fill),
                  ),
                ),
                20.ph,
                Padding(
                  padding:  EdgeInsets.only(bottom: 5.0.h),
                  child: Container(
                    height: 50.h,
                    decoration:  BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:  BorderRadius.circular(8.0),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: TabBar(
//                    isScrollable: false,
//                    physics: NeverScrollableScrollPhysics(),
                      labelColor: Theme.of(context).secondaryHeaderColor,

                      labelStyle: Theme.of(context).textTheme.bodyText1,
                      indicatorColor: Theme.of(context).accentColor,
                      unselectedLabelColor: Colors.grey,
                      unselectedLabelStyle: Theme.of(context).textTheme.caption!.copyWith(
                        fontSize: 14.sp
                      ),
                      indicatorSize: TabBarIndicatorSize.label,

                      tabs: const [
                        Tab(
                          text: "تسجيل الدخول",
                        ),
                        Tab(
                          text: "إنشاء حساب",
                        ),
                      ],
                    ),
                  ),
                ),


                /// tab view
                SizedBox(
                  // color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 400.h,
                  child: const TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      /// SignInPageMobile
                      SignInTab(),

                      /// NewAccountPageMobile
                      SignUpTab()
                    ],
                  ),
                )
          ],
        ),
              ),
            )));
  }
}

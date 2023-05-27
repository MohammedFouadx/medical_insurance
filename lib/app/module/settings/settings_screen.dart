
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';
import 'package:medical_insurance/app/module/auth/auth_tabs_screen.dart';
import 'package:medical_insurance/app/module/settings/change_password_screen.dart';
import 'package:medical_insurance/app/module/settings/suggestions_screen.dart';
import 'package:medical_insurance/app/services/screen_navigation_service.dart';

import '../../global_widgets/custom_card_icon_text.dart';
import '../home/widgets/home_app_bar.dart';


class SettingsScreen extends StatelessWidget {
   SettingsScreen({Key? key}) : super(key: key);

  bool notificationValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: const HomeAppBar(),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding:  EdgeInsets.all(10.0.h),
          child: ListView(
            children: [


              Text(
                "الإعدادات",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp
                ),
              ),

              20.ph,

              /// notifications
              CustomCardIconText(
                  color: Theme.of(context).primaryColor,
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.grey,
                    size: 20,
                  ),
                  iconColor: Colors.grey,
                  height: 40.h,
                  width: 45.w,
                  itemsName: "الإشعارات",
                  itemsNameStyle: Theme.of(context).textTheme.bodyText2,
                  secondWidget: FlutterSwitch(
                      width: 60.0.w,
                      height: 30.0.h,
                      toggleSize: 35.0,
                      value: true,
                      borderRadius: 30.0,
                      padding: 2.0,
                      inactiveIcon: const  Icon(Icons.notifications),
                      activeIcon: const Icon(Icons.notifications_active),
                      toggleColor: Theme.of(context).secondaryHeaderColor.withOpacity(0.5),

                      // switchBorder: Border.all(
                      //   color: const Color.fromRGBO(2, 107, 206, 1),
                      //   width: 6.0,
                      // ),
                      // toggleBorder: Border.all(
                      //   color: const Color.fromRGBO(2, 107, 206, 1),
                      //   width: 5.0,
                      // ),
                      activeColor: Colors.grey,
                      inactiveColor: Theme.of(context).backgroundColor,
                      onToggle: (val) {
                        // notificationValue = val;
                        print(val);
                      }
                  )




              ),

              20.ph,



              /// suggestions
              CustomCardIconText(
                  color: Theme.of(context).primaryColor,
                  icon: const Icon(
                    Icons.settings_suggest,
                    color: Colors.grey,
                    size: 20,
                  ),
                  height: 40.h,
                  width: 45.w,
                  itemsName: "الإقتراحات",
                  itemsNameStyle: Theme.of(context).textTheme.bodyText2,
                  secondIcon: Icons.arrow_forward_ios,
                  secondIconColor: Colors.grey,
                  onTap: () {
                    pushScreen(context, const SuggestionsScreen());
                  }
              ),

              20.ph,

              /// change password
              CustomCardIconText(
                  color: Theme.of(context).primaryColor,
                  icon: const Icon(
                    Icons.password,
                    color: Colors.grey,
                    size: 20,
                  ),
                  height: 40.h,
                  width: 45.w,
                  itemsName: "تعديل كلمة المرور",
                  itemsNameStyle: Theme.of(context).textTheme.bodyText2,
                  secondIcon: Icons.arrow_forward_ios,
                  secondIconColor: Colors.grey,
                  onTap: () {
                    pushScreen(context, const ChangePasswordScreen());
                  }
              ),




              20.ph,

              /// log out
              CustomCardIconText(
                  color: Theme.of(context).primaryColor,
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.grey,
                    size: 20,
                  ),
                  height: 40.h,
                  width: 45.w,
                  itemsName: "تسجيل الخروج",
                  itemsNameStyle: Theme.of(context).textTheme.bodyText2,
                  secondIconColor: Colors.grey,
                  onTap: () {
                    pushScreenReplacement(context, const AuthTabsScreen());
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

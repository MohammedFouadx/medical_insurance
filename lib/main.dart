
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/module/start/start.dart';
import 'package:medical_insurance/app/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'app/core/theme/app_theme.dart';
import 'app/data/providers/themeModel.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  ThemeModel themeChangeProvider=  ThemeModel();

  @override
  void initState() {
    super.initState();

    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme = await themeChangeProvider.darkThemePreference.getTheme();
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (context , model , child) {
          return ScreenUtilInit(
              designSize: const Size(360, 732),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: model.darkTheme == false
                      ? AppTheme.getLightTheme()
                      : AppTheme.getDarkTheme(),
                  home: const Directionality(
                      textDirection: TextDirection.rtl,
                      child: SplashScreen()
                  ),
                );
              }
          );
        },
      ),
    );
  }
}

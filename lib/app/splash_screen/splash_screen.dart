import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/values/app_images.dart';
import '../module/auth/auth_tabs_screen.dart';



class SplashScreen extends StatefulWidget {
  final Widget? stateful;
  const SplashScreen({Key? key, this.stateful}) : super(key: key);
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Platform.isIOS ?const Duration(milliseconds: 2700) : const Duration(milliseconds: 3700);
    return Timer(_duration, navigationPage );
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const AuthTabsScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,


      body: Center(
          child:  Image.asset(
            AppImages.logo,
            height:400,
            fit: BoxFit.fitHeight,
          ))

    );
  }
}

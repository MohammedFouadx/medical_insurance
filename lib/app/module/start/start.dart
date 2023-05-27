
import 'package:flutter/material.dart';
import 'package:medical_insurance/app/module/home/home_screen.dart';
import 'package:medical_insurance/app/module/medical_insurance/medical_insurance_screeen.dart';
import 'package:medical_insurance/app/module/medical_network/medical_network_screen.dart';
import '../settings/settings_screen.dart';

class StartScreen extends StatefulWidget {
   const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children:  [
              const HomeScreen(),
                MedicalNetworkScreen(),
                SettingsScreen(),
              const MedicalInsuranceScreen()

            ],
          ),
          bottomNavigationBar: BottomNavigationBar(

            type: BottomNavigationBarType.fixed    ,
            selectedItemColor: Colors.white,
            selectedFontSize:12,
            unselectedFontSize: 10,
            iconSize: 23,
            backgroundColor: Theme.of(context).selectedRowColor,
            selectedIconTheme: const IconThemeData(size: 28),
            unselectedItemColor: Theme.of(context).focusColor.withOpacity(1),
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            // this will be set when a new tab is tapped
            items: const[
              BottomNavigationBarItem(
                icon:  Icon(
                  Icons.home_filled,
                  color: Colors.grey,
                  size: 25,
                ),
                label: "الرئيسية",

                activeIcon:  Icon(
                  Icons.home_filled,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                icon:  Icon(
              Icons.language,
              color: Colors.grey,
              size: 25,
              ),
                label: "الشبكة الطبية",
                activeIcon: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                label: "الإعدادات",
                icon:  Icon(
                  Icons.settings,
                  color: Colors.grey,
                  size: 25,
                ),
                activeIcon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                icon:  Icon(
                  Icons.speaker_notes,
                  color: Colors.grey,
                  size: 25,
                ),
                label: "تأمينك الطبي" ,
                activeIcon: Icon(
                  Icons.speaker_notes,
                  color: Colors.white,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

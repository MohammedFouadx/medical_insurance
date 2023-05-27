import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/data/providers/themeModel.dart';
import 'package:provider/provider.dart';
import '../../../core/values/app_images.dart';




class HomeAppBar extends StatefulWidget {
  const  HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {


  @override
  Widget build(BuildContext context) {

    var themeChange = Provider.of<ThemeModel>(context);

    return SafeArea(
      child: Container(
        color: Theme.of(context).selectedRowColor , // black color
        child: Column(
          children: [
            // app header
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0.w , vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  Text(
                    "تأمينك الطبي",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.white
                    ),
                  ),


                  const Spacer(),

                  Padding(
                    padding:   EdgeInsets.only(left: 10.0.w , right: 10.0.w),
                    child:  InkWell(
                      onTap: () {
                        if(themeChange.darkTheme == false){
                          setState(() {
                            themeChange.darkTheme = true;
                          });
                        }else{
                          setState(() {
                            themeChange.darkTheme = false;
                          });
                        }
                      },
                      child:  Icon(
                        themeChange.darkTheme == false
                         ? CupertinoIcons.moon
                         : CupertinoIcons.sun_min,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

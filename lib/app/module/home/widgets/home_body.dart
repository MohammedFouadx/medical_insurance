
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/values/app_strings.dart';
import 'package:medical_insurance/app/global_widgets/custom_cached_network_image.dart';
import 'package:medical_insurance/app/global_widgets/custom_card_icon_text.dart';
import 'package:medical_insurance/app/module/home/home_details_screen.dart';

import '../../../core/utils/constants.dart';


class HomeBody extends StatelessWidget {
   HomeBody({Key? key}) : super(key: key);

  List<Map<String,dynamic>> items = [
    {
      "name" : "الإسترداد" , "desc" : "الية إسترداد قيمة تلقي الخدمة خارج الشبكة الطبية ${AppStrings.payBack1} ",
      "image" : "https://resources.nejmcareercenter.org/wp-content/uploads/PhhysicianEmploymentBenefitsSeeSomeShifts.jpg"
    },
    {
      "name" : "الإستثناءات" , "desc" : "الأشياء التي لاتغطيها بوليصة التأمين الطبي ${AppStrings.exceptions}",
      "image" : "https://media.npr.org/assets/img/2022/01/14/insurance-scam-getty-1277936049-01b145ad2d25844ac9f14077911e20e2a1b23908.jpg"
    },
    {
      "name" : "تلقي الخدمات الطبية" , "desc" : "لتلقي الخدمة داخل الشبكة الطبية ${AppStrings.medicalServices}",
      "image" : "https://x5u7v6p8.rocketcdn.me/blog/wp-content/uploads/2020/11/7.jpg"
    },
    {
      "name" : "مزايا التأمين الطبي" , "desc" : "الخدمات التي تستفيد منها عند إمتلاك بطاقة العلاج ${AppStrings.medicalInsurance}",
      "image" : "https://assets-global.website-files.com/6145f7156a1337613524d548/6439475f300f2a3d9bccf6fd_Group%20term%20life%20insurance%20benefits%20(2).jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: items.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context , index) {
        return Padding(
          padding:  EdgeInsets.all(10.0.h),
          child: CustomCardIconText(
            itemsName: items[index]['name'],
            itemsNameStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.bold
            ),
            subItemsName: items[index]['desc'],
            subItemsNameStyle: Theme.of(context).textTheme.caption!.copyWith(
              overflow: TextOverflow.ellipsis
            ),
            height: 100.h,
            width: 100.w,
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
              child: CustomCachedNetworkImage(
                imageUrl: items[index]['image'],
                height: 100.h,
                width: 100.w,
                fit: BoxFit.fitHeight,
              ),
            ),
            secondWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.push(
                  context,
                MaterialPageRoute(builder: (context) => HomeDetailsScreen(
                    name: items[index]['name'],
                    desc: items[index]['desc'],
                    image: items[index]['image'],
                ))
              );
            },
          ),
        );
      },
    );
  }
}

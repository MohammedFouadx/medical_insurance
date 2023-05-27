

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/constants.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';
import 'package:medical_insurance/app/global_widgets/custom_app_bar.dart';
import 'package:medical_insurance/app/module/medical_network/widgets/filter_card.dart';
import 'package:medical_insurance/app/module/medical_network/widgets/medical_network_card.dart';

import '../../global_widgets/custom_text_form_field.dart';

class MedicalNetworkDetails extends StatefulWidget {
  const MedicalNetworkDetails({Key? key}) : super(key: key);

  @override
  State<MedicalNetworkDetails> createState() => _MedicalNetworkDetailsState();
}

class _MedicalNetworkDetailsState extends State<MedicalNetworkDetails> {

  TextEditingController searchController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
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
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.all(10.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "مراكز اسنان",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp
                  ),
                ),
                20.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      child:  FilterCard(
                        filterName: "صنعاء",
                      ),
                    ),
                    10.pw,
                    const Expanded(
                      child:  FilterCard(
                        filterName: "مراكز اسنان",
                      ),
                    ),
                  ],
                ),

                20.ph,
                CustomTextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 10.w),
                  hintText: "إبحث",
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 20,

                  ),
                  onFieldSubmitted: (){

                  },
                  onChanged: (value){},

                ),
                20.ph,

                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                      // color: Theme.of(context).primaryColor
                    ),
                    child: ListView.separated(
                      itemCount: 10,
                      separatorBuilder: (context , _ ) => 10.ph,
                      itemBuilder: (context , index){
                        return MedicalNetworkCard(
                            ratingWidget: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:

                                List.generate( 5, (index) {
                                  return index < double.parse("4").round()
                                      ?   Icon(Icons.star , color: Theme.of(context).accentColor,)
                                      : index > double.parse("4").round() - 1 &&
                                      index < double.parse("4").round()
                                      ?  Icon(Icons.star_half , color: Theme.of(context).accentColor,)
                                      : const Icon(Icons.star , color: Colors.grey,);
                                })
                            ),
                            itemsName: "مستشفى بروج صنعاء الدولي",
                            itemsNameStyle: Theme.of(context).textTheme.bodyText2,
                            subItemsName: "شارع حدة - أمام سوبر ماركت الجندول",
                            subItemsNameStyle: Theme.of(context).textTheme.caption,
                            icon: const Icon(
                              CupertinoIcons.house,
                              size: 20,
                              color: Colors.grey,
                            ),

                        );
                      },
                    )
                  ),
                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}

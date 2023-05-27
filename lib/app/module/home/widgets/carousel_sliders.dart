
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../global_widgets/custom_cached_network_image.dart';


class CarouselSliders extends StatefulWidget {
   const CarouselSliders({Key? key}) : super(key: key);

  @override
  State<CarouselSliders> createState() => _CarouselSlidersState();
}

class _CarouselSlidersState extends State<CarouselSliders> {

  int currentIndex = 0;

  List<Map<String , dynamic>> sliderList = [
    {
      "name": "التأمين الطبي",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU1RsmRNOgZ4QYUwT3wtNdL2yMhvLhUt0JQdnt91ml9CV_JRocvcO8t_0TiYyleGN__Zs&usqp=CAU",
    },
    {
      "name" : "أهداف التأمين", "image" : "data:image/jpeg;base64,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",
    },
    {
      "name" : "عناصر التأمين" , "image" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSb1QFnkg0RNG7ZnAwvN-LU7CxZLVsAH-En3ILX7qQq46rc27gmrcJOt68ahSwDJmxEGk&usqp=CAU"
    }
  ];


  @override
  Widget build(BuildContext context) {

    return CarouselSlider.builder(
      itemCount: sliderList.length,
      // carouselController: _controller,
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        viewportFraction: 1.0,
        height: 180.h,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },      ),

      itemBuilder: (context, index, realIdx) {

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [

                /// image
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180.h,
                  color: Theme.of(context).primaryColor,
                  child: CustomCachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.fill,
                    imageUrl: sliderList[index]['image'],
                  ),
                ),


                /// image text & dots
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
                    padding: EdgeInsets.all(5.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sliderList[index]['name'],
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp
                          ),
                        ),
                        Row(
                          children: List.generate(sliderList.length, (index) {
                            return Padding(
                              padding:  EdgeInsets.all(5.0.h),
                              child: Container(
                                width: 10.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == index
                                        ? Theme.of(context).accentColor
                                        : Theme.of(context).primaryColor
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),

          ],
        );
      },
    );


  }

}

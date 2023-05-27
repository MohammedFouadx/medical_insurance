
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/values/app_icons.dart';



class CustomSlidingPanel extends StatelessWidget {
  final GestureTapCallback? onTapGallery;
  final GestureTapCallback? onTapCamera;
  // final Widget galleryWidget;
  // final Widget cameraWidget;
  // final String cameraText;
  // final String galleryText;
  const CustomSlidingPanel({
    Key? key,
    required this.onTapGallery,
    required this.onTapCamera,
    // required this.galleryWidget,
    // required this.cameraWidget,
    // required this.cameraText,
    // required this.galleryText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Material(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).backgroundColor),
              borderRadius: BorderRadius.circular(8.0)),
          child: Container(
            width: 100.0.w,
            padding: EdgeInsets.all(5.h),
            child: InkWell(
              onTap: onTapGallery,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppIcons.gallery,
                      fit: BoxFit.cover,
                      color: Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
                    ),

                    Text(
                      "المعرض",
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Material(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).backgroundColor),
              borderRadius: BorderRadius.circular(8.0)),
          child: Container(
            width: 100.0.w,
            padding: EdgeInsets.all(5.h),
            child: InkWell(
              onTap: onTapCamera,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppIcons.camera,
                      color: Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
                    ),

                    Text(
                      "الكاميرا",
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

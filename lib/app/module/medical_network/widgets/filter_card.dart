import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/constants.dart';


class FilterCard extends StatelessWidget {
  final String filterName;
  const FilterCard({
    Key? key,
    required this.filterName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 110.w,
      padding: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
          color: Theme.of(context).primaryColor
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              filterName,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Icon(
              Icons.arrow_drop_down_outlined,
              size: 20,
              color: Theme.of(context).secondaryHeaderColor,
            )
          ],
        ),
      ),
    );
  }
}

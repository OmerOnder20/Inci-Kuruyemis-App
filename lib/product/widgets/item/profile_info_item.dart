import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/colors/color_utility.dart';
import '../../utility/sizes/sizes.dart';
import '../../utility/sizes/widget_size.dart';
import '../text/label/label_large_2.dart';

class ProfilInfoItem extends StatelessWidget {
  final String text;
  final PageRouteInfo? pageRouteInfo;
  const ProfilInfoItem({
    super.key,
    required this.text,
    this.pageRouteInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: WidgetSizes.profilInfoItemHeight,
          width: double.infinity,
          child: InkWell(
            highlightColor: ColorUtility.whiteColor,
            onTap: () {
              if (pageRouteInfo != null) {
                context.router.push(pageRouteInfo!);
              }
            },
            child: Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: SizeUtility.mediumxX.h,
                      width: SizeUtility.mediumxX.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorUtility.yellowColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18.w),
                      child: LabelLarge2(
                        text: text,
                      ),
                    )
                  ]),
            ),
          ),
        ),
        Container(
          height: 4.h,
          width: double.infinity,
          color: ColorUtility.avatarColorGrey,
        )
      ],
    );
  }
}

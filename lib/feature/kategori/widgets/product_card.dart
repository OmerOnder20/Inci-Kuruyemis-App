import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/navigator/app_router.dart';

import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/sizes/sizes.dart';
import '../../../product/widgets/text/label/label_small_2.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      color: ColorUtility.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(alignment: Alignment.topRight, children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                      radius: 50.h,
                      backgroundColor: ColorUtility.avatarColorGrey,
                      backgroundImage: const AssetImage(
                        "assets/randomImage/kuruyemis.jpg",
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 10.w),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: LabelSmall2(text: "Kavrulmuş Yer Fıstığı"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
          child: SizedBox(
            height: SizeUtility.mediumXx.h,
            width: SizeUtility.mediumXx.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorUtility.blackColor,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    shape: const CircleBorder()),
                onPressed: () {
                  context.router.push(UrunDetayRoute());
                },
                child: Icon(
                  Icons.add,
                  size: 15.h,
                  color: ColorUtility.whiteColor,
                )),
          ),
        ),
      ]),
    );
  }
}

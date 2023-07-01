import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/navigator/app_router.dart';

import '../../../product/utility/colors/color_utility.dart';
import '../../../product/widgets/text/label/label_small_1.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: ColorUtility.scaffoldBackGroundColor,
      onTap: () {
        context.router.push(const KategoriRoute());
      },
      child: Card(
        elevation: 1,
        margin: EdgeInsets.zero,
        color: ColorUtility.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: EdgeInsets.only(
            top: 5.h,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage(
                    "assets/randomImage/kuruyemis.jpg",
                  ),
                  radius: 34.r,
                  backgroundColor: ColorUtility.avatarColorGrey,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 19, right: 25),
                  child: const LabelSmall1(
                    text: "Kuruyemiş, Çerez",
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

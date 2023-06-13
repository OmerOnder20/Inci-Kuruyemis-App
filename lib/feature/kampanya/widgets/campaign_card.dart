import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/navigator/app_router.dart';
import 'package:inci_kuruyemis/product/widgets/texts/title/title_large_2.dart';

import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/sizes/sizes.dart';
import '../../../product/utility/sizes/widget_size.dart';
import '../../../product/widgets/texts/label/label_medium_1.dart';

class CampaignCard extends StatelessWidget {
  const CampaignCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: WidgetSizes.campaignCardHeight,
          width: double.infinity,
          child: Card(
            elevation: 1,
            margin: EdgeInsets.zero,
            color: ColorUtility.whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      20,
                    ),
                    bottom: Radius.circular(
                      5,
                    ))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: WidgetSizes.campaignCardImageHeight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        image:
                            DecorationImage(image: AssetImage("assets/randomImage/delivery.jpg"), fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 5),
                    child: TitleLarge2(text: "Kargo Bedava Kampanyası"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h, left: 5.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: WidgetSizes.campaignCardTextHeight,
                            width: WidgetSizes.campaignCardTextWidth,
                            child: LabelMedium1(
                                text:
                                    "300.00 ₺ üzeri alışveriş yapan müşterilerimize kargo ücretsiz ve kapıda ödeme mevcuttur"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.h, right: 5.w),
                            child: InkWell(
                              highlightColor: ColorUtility.whiteColor,
                              focusColor: ColorUtility.whiteColor,
                              splashColor: ColorUtility.whiteColor,
                              onTap: () {
                                context.router.push(KampanyaDetayRoute());
                              },
                              child: Container(
                                height: SizeUtility.mediumXX.h,
                                width: SizeUtility.mediumXX.w,
                                decoration: BoxDecoration(color: ColorUtility.yellowColor, shape: BoxShape.circle),
                                child: Icon(
                                  Icons.chevron_right_rounded,
                                  color: ColorUtility.whiteColor,
                                  size: SizeUtility.mediumxX,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  )
                ]),
          )),
    );
  }
}

                          // "300.00 ₺ üzeri alışveriş yapan müşterilerimize kargo ücretsiz ve kapıda ödeme şeklimiz"

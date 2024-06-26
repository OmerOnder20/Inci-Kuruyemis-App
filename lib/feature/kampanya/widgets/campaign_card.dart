import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_large_2.dart';

import '../../../product/utility/colors/color_utility.dart';
import '../../../core/size/sizes.dart';
import '../../../product/utility/sizes/widget_size.dart';
import '../../../product/widgets/text/label/label_medium_1.dart';

class CampaignCard extends StatelessWidget {
  final String kampanyaName;
  final String kampanyaSummary;
  final String kampanyaUrl;
  const CampaignCard({
    super.key,
    required this.kampanyaName,
    required this.kampanyaSummary,
    required this.kampanyaUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 1,
            margin: EdgeInsets.zero,
            color: ColorUtility.whiteColor,
            shape: const RoundedRectangleBorder(
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
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20)),
                        image: DecorationImage(
                            image: NetworkImage(kampanyaUrl),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 5),
                    child: TitleLarge2(text: kampanyaName),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h, left: 5.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: LabelMedium1(text: kampanyaSummary),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5.h, right: 5.w, bottom: 10.h),
                            child: Container(
                              height: SizeUtility.mediumXX.h,
                              width: SizeUtility.mediumXX.w,
                              decoration: const BoxDecoration(
                                  color: ColorUtility.yellowColor,
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.chevron_right_rounded,
                                color: ColorUtility.whiteColor,
                                size: SizeUtility.mediumxX,
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

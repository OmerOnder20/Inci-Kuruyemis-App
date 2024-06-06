import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inci_kuruyemis/product/utility/sizes/widget_size.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_large_5.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../product/models/ürün_model.dart';
import '../../../product/utility/colors/color_utility.dart';
import '../../../core/spacer/spacer_utility.dart';

class DetailColumn extends StatelessWidget {
  final Products products;

  DetailColumn({
    super.key,
    required this.controller,
    required this.products,
  });
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SpacerUtility.mediumXXX,
      Center(
        child: SizedBox(
          height: WidgetSizes.detailPageViewBuilderHeightAndWidth,
          width: double.infinity,
          child: PageView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return CircleAvatar(
                child: SvgPicture.network(products.images?[index].path ?? ""),
                radius: 40.r,
                backgroundColor: ColorUtility.scaffoldBackGroundColor,
              );
            },
          ),
        ),
      ),
      SpacerUtility.mediumX,
      DetailIndicator(
        count: 3,
        controller: controller,
      ),
      SpacerUtility.mediumX,
      LabelLarge5(text: products.name ?? ""),
    ]);
  }
}

class DetailIndicator extends StatelessWidget {
  const DetailIndicator({
    super.key,
    required this.controller,
    required this.count,
  });

  final PageController controller;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: controller,
        count: count,
        effect: const ScrollingDotsEffect(
            activeDotScale: 1,
            spacing: 4,
            dotHeight: 8,
            dotWidth: 8,
            dotColor: ColorUtility.whiteColor,
            activeDotColor: ColorUtility.blackColor));
  }
}

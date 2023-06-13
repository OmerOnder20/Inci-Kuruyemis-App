import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/utility/sizes/widget_size.dart';
import 'package:inci_kuruyemis/product/widgets/texts/label/label_large_5.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/spacer/spacer_utility.dart';

class DetailColumn extends StatelessWidget {
  DetailColumn({super.key, required this.controller});
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
                backgroundImage: AssetImage(
                  "assets/randomImage/kuruyemis.jpg",
                ),
                radius: 40.r,
                backgroundColor: ColorUtility.avatarColorGrey,
              );
              //Buraya SizedBox koyacaksın sonra da childına servisten gelen resimli dataları direkt
              //Image.network() şeklinde yükleyeceksin.Bunu yaparken fit:BoxFit.cover vermeyi unutma
              //Buradaki itemXount sayısı ile PageIndicator count sayısı eşit olmak zorunda.
            },
          ),
        ),
      ),
      SpacerUtility.mediumX,
      DetailIndicator(
        controller: controller,
      ),
      SpacerUtility.mediumX,
      LabelLarge5(text: "Kavrulmuş Yer Fıstığı"),
    ]);
  }
}

class DetailIndicator extends StatelessWidget {
  const DetailIndicator({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: controller,
        count: 3,
        effect: ScrollingDotsEffect(
            activeDotScale: 1,
            spacing: 4,
            dotHeight: 8,
            dotWidth: 8,
            dotColor: ColorUtility.whiteColor,
            activeDotColor: ColorUtility.blackColor));
  }
}

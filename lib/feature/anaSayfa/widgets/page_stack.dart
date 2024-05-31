import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../product/utility/sizes/widget_size.dart';
import '../random_image_list.dart';

class PageStack extends StatelessWidget {
  final PageController controller;
  PageStack({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    //BURAYA YUKLENIRKEN SHIMMER AYARLANACAK.
    // if (isLoading == true) {
    //   return   Shimmer.fromColors(
    //             baseColor: Colors.grey.shade300,
    //             highlightColor: Colors.grey.shade100,
    //             child: Container(
    //               height: WidgetSizes.anaSayfaPageViewBuilderHeight,
    //               width: double.infinity,
    //               color: Colors.grey.shade300,
    //             ),
    //           ),
    // }
    return Stack(alignment: Alignment.bottomLeft, children: [
      SizedBox(
        height: WidgetSizes.anaSayfaPageViewBuilderHeight,
        width: double.infinity,
        child: PageView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: RandomImageList().randomImageList.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      RandomImageList().randomImageList[index].toString(),
                    )),
              ),
            );
            //Buraya SizedBox koyacaksın sonra da childına servisten gelen resimli dataları direkt
            //Image.network() şeklinde yükleyeceksin.Bunu yaparken fit:BoxFit.cover vermeyi unutma
            //Buradaki itemXount sayısı ile PageIndicator count sayısı eşit olmak zorunda.
          },
        ),
      ),
      PageIndicator(controller: controller)
    ]);
  }
}

class PageIndicator extends StatelessWidget {
  final PageController controller;
  const PageIndicator({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, bottom: 20.h),
      child: SmoothPageIndicator(
        controller: controller,
        count: RandomImageList().randomImageList.length,
        effect: const ScrollingDotsEffect(
            activeDotScale: 1.5,
            spacing: 4,
            dotHeight: 8,
            dotWidth: 8,
            dotColor: ColorUtility.whiteColor,
            activeDotColor: ColorUtility.yellowColor),
      ),
    );
  }
}

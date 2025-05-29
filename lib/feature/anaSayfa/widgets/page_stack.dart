import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/viewModel/ana_sayfa_provider.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../product/utility/sizes/widget_size.dart';

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
    return Consumer<AnaSayfaProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return SizedBox(
            height: WidgetSizes.anaSayfaPageViewBuilderHeight,
            width: double.infinity,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                color: Colors.grey.shade300,
              ),
            ),
          );
        }
        return Stack(alignment: Alignment.bottomLeft, children: [
          SizedBox(
            height: WidgetSizes.anaSayfaPageViewBuilderHeight,
            width: double.infinity,
            child: PageView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: provider.slideItems?.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          provider.slideItems![index].image?.path ?? "",
                        )),
                  ),
                );
              },
            ),
          ),
          PageIndicator(
            controller: controller,
            indicatorCount: provider.slideItems?.length ?? 0,
          )
        ]);
      },
    );
  }
}

class PageIndicator extends StatelessWidget {
  final PageController controller;
  final int? indicatorCount;
  const PageIndicator({
    super.key,
    required this.controller,
    this.indicatorCount,
  });

  @override
  Widget build(BuildContext context) {
    // Eğer count null veya sıfırsa indicator göstermeyelim
    if (indicatorCount == null || indicatorCount == 0) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(left: 20.w, bottom: 20.h),
      child: SmoothPageIndicator(
        controller: controller,
        count: indicatorCount!,
        effect: const ScrollingDotsEffect(
          activeDotScale: 1.5,
          spacing: 4,
          dotHeight: 8,
          dotWidth: 8,
          dotColor: ColorUtility.whiteColor,
          activeDotColor: ColorUtility.yellowColor,
        ),
      ),
    );
  }
}

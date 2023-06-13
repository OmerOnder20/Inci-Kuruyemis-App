import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/%C3%BCr%C3%BCnDetay/widgets/detail_column.dart';
import 'package:inci_kuruyemis/feature/%C3%BCr%C3%BCnDetay/widgets/detail_info_row.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/product/utility/spacer/spacer_utility.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';
import 'package:inci_kuruyemis/product/widgets/texts/title/title_small_1.dart';

import '../../product/utility/colors/color_utility.dart';
import '../../product/utility/sizes/sizes.dart';
import '../../product/utility/sizes/widget_size.dart';
import '../../product/widgets/button/pop_button.dart';
import 'widgets/product_column.dart';

@RoutePage()
class UrunDetayView extends StatefulWidget {
  UrunDetayView({super.key});

  @override
  State<UrunDetayView> createState() => _UrunDetayViewState();
}

class _UrunDetayViewState extends State<UrunDetayView> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: DetailFloatingActionButton(),
      appBar: CustomAppBar(
        title: StringConstants.urunDetayi,
        leading: PopButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              DetailColumn(controller: _controller),
              SpacerUtility.smallXXX,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: DetailDividerOne(),
              ),
              SpacerUtility.smallXX,
              DetailInfoRow(),
              SpacerUtility.smallX,
              DetailDividerOne(),
              SpacerUtility.smallX,
              ProductColumn()
            ],
          ),
        ),
      ),
    );
  }
}

class DetailFloatingActionButton extends StatelessWidget {
  const DetailFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSizes.detailFloatingActionButtonHeight,
      width: WidgetSizes.detailFloatingActionButtonWidth,
      child: FloatingActionButton.extended(
        heroTag: null,
        highlightElevation: 1,
        focusElevation: 1,
        elevation: 1,
        splashColor: ColorUtility.yellowColor,
        backgroundColor: Colors.amber,
        onPressed: () {},
        label: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleSmall1(
              text: StringConstants.sepeteEkle,
            ),
            SizedBox(
              width: 5.w,
            ),
            Icon(Icons.shopping_cart_rounded, color: ColorUtility.whiteColor, size: SizeUtility.mediumx)
          ],
        ),
      ),
    );
  }
}

class DetailDividerOne extends StatelessWidget {
  const DetailDividerOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.h,
      width: double.infinity,
      color: ColorUtility.avatarColorGrey,
    );
  }
}

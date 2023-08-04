import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/%C3%BCr%C3%BCnDetay/view/%C3%BCr%C3%BCn_detay_view.dart';
import 'package:inci_kuruyemis/product/controller/user_controller.dart';
import 'package:inci_kuruyemis/product/models/%C3%BCr%C3%BCn_model.dart';
import 'package:inci_kuruyemis/product/utility/spacer/spacer_utility.dart';
import 'package:inci_kuruyemis/product/widgets/button/gramaj_button.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_large_5.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_medium_4.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_large_3.dart';
import 'package:provider/provider.dart';

import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../product/utility/sizes/sizes.dart';
import '../../../product/utility/sizes/widget_size.dart';

class DetailInfoRow extends StatelessWidget {
  final Products products;
  const DetailInfoRow({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final selectedValuePrice =
        context.watch<UserController>().selectedVariation;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const LabelMedium4(text: StringConstants.gramaj),
        const DetailDividerTwo(),
        ChooseGramajButton(products: products),
        const DetailDividerTwo(),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TitleLarge3(
              text: products.variations?[selectedValuePrice].price ?? ""),
        ),
      ],
    );
  }
}

class ChooseGramajButton extends StatelessWidget {
  final Products products;

  const ChooseGramajButton({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        height: WidgetSizes.detailTextButtonHeight,
        width: WidgetSizes.detailTextButtonWidth,
        child: TextButton(
            style: TextButton.styleFrom(
                foregroundColor: ColorUtility.textColorGrey,
                padding: EdgeInsets.zero),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: ColorUtility.scaffoldBackGroundColor,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10))),
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: WidgetSizes.detailSheetHeight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.w),
                              child: const LabelLarge5(
                                  text: StringConstants.gramaj),
                            ),
                            SpacerUtility.smallX,
                            const DetailDividerOne(),
                            SpacerUtility.smallX,
                            GramajButton(
                              text: products.variations?[0].name ?? "",
                              onPressed: () {
                                context
                                    .read<UserController>()
                                    .selectVariation1();
                                context.router.pop();
                              },
                            ),
                            SpacerUtility.smallX,
                            const DetailDividerThree(),
                            SpacerUtility.smallX,
                            GramajButton(
                              text: products.variations?[1].name ?? "",
                              onPressed: () {
                                context
                                    .read<UserController>()
                                    .selectVariation2();
                                context.router.pop();
                              },
                            ),
                            SpacerUtility.smallX,
                            const DetailDividerThree(),
                            SpacerUtility.smallX,
                            GramajButton(
                              text: products.variations?[2].name ?? "",
                              onPressed: () {
                                context
                                    .read<UserController>()
                                    .selectVariation3();
                                context.router.pop();
                              },
                            ),
                            SpacerUtility.smallX,
                            const DetailDividerThree(),
                            SpacerUtility.smallX,
                            GramajButton(
                              text: products.variations?[3].name ?? "",
                              onPressed: () {
                                context
                                    .read<UserController>()
                                    .selectVariation4();
                                context.router.pop();
                              },
                            ),
                            SpacerUtility.smallX,
                            const DetailDividerThree(),
                          ]),
                    ),
                  );
                },
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LabelMedium4(text: StringConstants.sec),
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_downward_rounded,
                    color: ColorUtility.textColorBlack,
                    size: SizeUtility.mediumx,
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class DetailDividerThree extends StatelessWidget {
  const DetailDividerThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 0.5.h,
        width: double.infinity,
        color: ColorUtility.avatarColorGrey,
      ),
    );
  }
}

class DetailDividerTwo extends StatelessWidget {
  const DetailDividerTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        height: 20.h,
        width: 2,
        color: ColorUtility.textColorGrey,
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/controller/cart_controller.dart';
import 'package:inci_kuruyemis/product/models/%C3%BCr%C3%BCn_model.dart';
import 'package:inci_kuruyemis/core/spacer/spacer_utility.dart';
import 'package:inci_kuruyemis/product/widgets/button/gramaj_button.dart';
import 'package:inci_kuruyemis/product/widgets/divider/divider_huge.dart';
import 'package:inci_kuruyemis/product/widgets/divider/divider_large.dart';
import 'package:inci_kuruyemis/product/widgets/divider/divider_small.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_large_5.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_medium_4.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_large_3.dart';
import 'package:provider/provider.dart';
import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../core/size/sizes.dart';
import '../../../product/utility/sizes/widget_size.dart';

class DetailInfoRow extends StatelessWidget {
  final Products products;
  const DetailInfoRow({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const LabelMedium4(text: StringConstants.gramaj),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: DividerHuge(),
        ),
        ChooseGramajButton(products: products),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: DividerHuge(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Consumer<CartController>(
            builder: (context, value, child) {
              return TitleLarge3(
                  text:
                      "${products.variations?[products.variationIndex].price ?? ""}  ₺");
            },
          ),
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
    final userController = Provider.of<CartController>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 20),
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
                            const DividerLarge(),
                            SpacerUtility.smallX,
                            GramajButton(
                              text: products.variations?[0].name ?? "",
                              onPressed: () {
                                userController.selectVariation(products, 0);
                                // ignore: deprecated_member_use
                                context.router.pop();
                                print(products.variationIndex.toString());
                              },
                            ),
                            SpacerUtility.smallX,
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: DividerSmall(),
                            ),
                            SpacerUtility.smallX,
                            GramajButton(
                              text: products.variations?[1].name ?? "",
                              onPressed: () {
                                userController.selectVariation(products, 1);
                                // ignore: deprecated_member_use
                                context.router.pop();
                                print(products.variationIndex.toString());
                              },
                            ),
                            SpacerUtility.smallX,
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: DividerSmall(),
                            ),
                            SpacerUtility.smallX,
                            GramajButton(
                              text: products.variations?[2].name ?? "",
                              onPressed: () {
                                userController.selectVariation(products, 2);
                                // ignore: deprecated_member_use
                                context.router.pop();
                                print(products.variationIndex.toString());
                              },
                            ),
                            SpacerUtility.smallX,
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: DividerSmall(),
                            ),
                            SpacerUtility.smallX,
                            GramajButton(
                              text: products.variations?[3].name ?? "",
                              onPressed: () {
                                userController.selectVariation(products, 3);
                                // ignore: deprecated_member_use
                                context.router.pop();
                                print(products.variationIndex.toString());
                              },
                            ),
                            SpacerUtility.smallX,
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: DividerSmall(),
                            ),
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
                Consumer<CartController>(
                  builder: (context, value, child) {
                    if (products.isShown == false) {
                      return const LabelMedium4(text: StringConstants.sec);
                    } else {
                      return LabelMedium4(
                          text: products
                                  .variations?[products.variationIndex].name ??
                              "");
                    }
                  },
                ),
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

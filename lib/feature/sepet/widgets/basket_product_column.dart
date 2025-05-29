import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/controller/cart_controller.dart';
import 'package:inci_kuruyemis/product/widgets/divider/divider_medium.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_large_3.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_large_4.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_medium_2.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_medium_3.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_medium_1.dart';
import 'package:provider/provider.dart';

import '../../../product/models/ürün_model.dart';
import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../core/size/sizes.dart';
import '../../../product/utility/sizes/widget_size.dart';
import '../../../core/spacer/spacer_utility.dart';
import '../../../product/widgets/text/title/title_small_1.dart';

class BasketProductColumn extends StatelessWidget {
  final String productName;
  final String variationName;
  final String variationPrice;
  final String imageUrl;
  final int productCount;
  final Products products;
  const BasketProductColumn({
    super.key,
    required this.productName,
    required this.variationName,
    required this.variationPrice,
    required this.imageUrl,
    required this.productCount,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: WidgetSizes.basketProductColumnHeight,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 24, left: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    height: WidgetSizes.basketImageHeight,
                    width: WidgetSizes.basketImageWidth,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "",
                            )),
                        color: ColorUtility.avatarColorGrey,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1, color: ColorUtility.greyColor)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.w, top: 6.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        LabelMedium2(
                          text: productName,
                        ),
                        SpacerUtility.smallX,
                        LabelLarge3(
                          text: "${variationPrice} ₺",
                        ),
                        SpacerUtility.smallX,
                        LabelMedium3(
                          text: variationName,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 20.w),
                    child: Column(
                      children: [
                        IncreaseDeincreaseButton(
                            productCount: productCount, products: products),
                        SpacerUtility.smallXXX,
                        Flexible(
                            child: TitleMedium1(
                          text:
                              "${(double.tryParse(variationPrice) ?? 0) * productCount} ₺",
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerRight,
                        foregroundColor: ColorUtility.scaffoldBackGroundColor,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 45.w.w, vertical: 50.h),
                            title: const Center(
                                child: TitleMedium1(
                              text: StringConstants.buUrunuKaldir,
                            )),
                            backgroundColor:
                                ColorUtility.scaffoldBackGroundColor,
                            children: [
                              Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ProductRemoveEvet(
                                      products: products,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const ProductRemoveHayir(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      child: const LabelLarge3(text: StringConstants.kaldir),
                    ),
                  )
                ]),
          ),
        ),
        const DividerMedium()
      ],
    );
  }
}

class ProductRemoveHayir extends StatelessWidget {
  const ProductRemoveHayir({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.amber,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const TitleSmall1(text: StringConstants.hayir),
    );
  }
}

class ProductRemoveEvet extends StatelessWidget {
  final Products products;
  const ProductRemoveEvet({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.amber,
      ),
      onPressed: () {
        context.read<CartController>().removeUrun(products);

        Navigator.of(context).pop();
      },
      child: const TitleSmall1(text: StringConstants.evet),
    );
  }
}

class IncreaseDeincreaseButton extends StatelessWidget {
  final int productCount;
  final Products products;
  const IncreaseDeincreaseButton({
    super.key,
    required this.productCount,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: WidgetSizes.increaseDeincreaseButtonHeight,
      width: WidgetSizes.increaseDeincreaseButtonWidth,
      decoration: BoxDecoration(
          color: ColorUtility.scaffoldBackGroundColor,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(width: 1, color: ColorUtility.greyColor)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IncreaseButton(products: products),
              LabelLarge4(
                text: productCount.toString(),
              ),
              DeincreaseButton(
                products: products,
              )
            ]),
      ),
    );
  }
}

class DeincreaseButton extends StatelessWidget {
  final Products products;
  const DeincreaseButton({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtility.mediumX.h,
      width: SizeUtility.mediumX.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: ColorUtility.textColorGrey,
              shape: const CircleBorder()),
          onPressed: () {
            context.read<CartController>().urunAdetArtma(products);
          },
          child: Icon(
            Icons.add_rounded,
            color: ColorUtility.whiteColor,
            size: SizeUtility.mediumxX.w,
          )),
    );
  }
}

class IncreaseButton extends StatelessWidget {
  final Products products;

  const IncreaseButton({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtility.mediumX.h,
      width: SizeUtility.mediumX.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: ColorUtility.textColorGrey,
              shape: const CircleBorder()),
          onPressed: () {
            context.read<CartController>().urunAdetAzaltma(products);
          },
          child: Icon(
            Icons.remove_rounded,
            color: ColorUtility.whiteColor,
            size: SizeUtility.mediumxX.w,
          )),
    );
  }
}

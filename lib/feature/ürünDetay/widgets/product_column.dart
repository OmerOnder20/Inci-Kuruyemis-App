import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/%C3%BCr%C3%BCn%C3%96zellikler/view/%C3%BCr%C3%BCn_%C3%B6zellikler_view.dart';
import 'package:inci_kuruyemis/product/navigator/app_router.dart';
import 'package:inci_kuruyemis/product/utility/sizes/sizes.dart';
import 'package:inci_kuruyemis/product/widgets/divider/divider_large.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_medium_4.dart';

import '../../../product/models/ürün_model.dart';
import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../product/utility/spacer/spacer_utility.dart';

class ProductColumn extends StatelessWidget {
  final Products products;
  const ProductColumn({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductFeaturesButton(
          products: products,
        ),
        SpacerUtility.smallX,
        const DividerLarge(),
        SpacerUtility.smallX,
        const PaymentOptionsButton(),
        SpacerUtility.smallX,
        const DividerLarge(),
        SpacerUtility.smallX,
        const DeliveryButton(),
        SpacerUtility.smallX,
        const DividerLarge(),
      ],
    );
  }
}

class DetailDividerOne {
  const DetailDividerOne();
}

class DeliveryButton extends StatelessWidget {
  const DeliveryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: ColorUtility.textColorGrey),
          onPressed: () {
            context.router.push(const KargoTeslimatRoute());
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LabelMedium4(text: StringConstants.kargoVeTeslimat),
              Icon(
                Icons.chevron_right_rounded,
                size: SizeUtility.mediumXx.h,
                color: ColorUtility.textColorBlack,
              )
            ],
          )),
    );
  }
}

class PaymentOptionsButton extends StatelessWidget {
  const PaymentOptionsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: ColorUtility.textColorGrey),
          onPressed: () {
            context.router.push(const OdemeSecenekleriRoute());
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LabelMedium4(text: StringConstants.odemeSecenekleri),
              Icon(
                Icons.chevron_right_rounded,
                size: SizeUtility.mediumXx.h,
                color: ColorUtility.textColorBlack,
              )
            ],
          )),
    );
  }
}

class ProductFeaturesButton extends StatelessWidget {
  final Products products;
  const ProductFeaturesButton({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: ColorUtility.textColorGrey),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UrunOzelliklerView(
                  urunName: products.name ?? "",
                  description: products.description ?? ""),
            ));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LabelMedium4(text: StringConstants.urunOzellikleri),
              Icon(
                Icons.chevron_right_rounded,
                size: SizeUtility.mediumXx.h,
                color: ColorUtility.textColorBlack,
              )
            ],
          )),
    );
  }
}

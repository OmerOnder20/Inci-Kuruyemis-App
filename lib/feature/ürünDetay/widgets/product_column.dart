import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/navigator/app_router.dart';
import 'package:inci_kuruyemis/product/utility/sizes/sizes.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_medium_4.dart';

import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../product/utility/spacer/spacer_utility.dart';
import '../ürün_detay_view.dart';

class ProductColumn extends StatelessWidget {
  const ProductColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProductFeaturesButton(),
        SpacerUtility.smallX,
        const DetailDividerOne(),
        SpacerUtility.smallX,
        const PaymentOptionsButton(),
        SpacerUtility.smallX,
        const DetailDividerOne(),
        SpacerUtility.smallX,
        const DeliveryButton(),
        SpacerUtility.smallX,
        const DetailDividerOne(),
      ],
    );
  }
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
          onPressed: () {},
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
          onPressed: () {},
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
  const ProductFeaturesButton({
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
            context.router.push(const UrunOzelliklerRoute());
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

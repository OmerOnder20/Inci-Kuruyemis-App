import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_large_3.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_large_4.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_medium_2.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_medium_3.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_medium_1.dart';

import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/sizes/sizes.dart';
import '../../../product/utility/sizes/widget_size.dart';
import '../../../product/utility/spacer/spacer_utility.dart';

class BasketProductColumn extends StatelessWidget {
  const BasketProductColumn({super.key});

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
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
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
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/randomImage/real_pizza.jpg",
                            )),
                        color: ColorUtility.avatarColorGrey,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: ColorUtility.greyColor)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.w, top: 6.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        LabelMedium2(
                          text: "Kavrulmuş Yer Fıstığı",
                        ),
                        SpacerUtility.smallX,
                        LabelLarge3(
                          text: "100.00 ₺",
                        ),
                        SpacerUtility.smallX,
                        LabelMedium3(
                          text: "500 GR",
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 20.w),
                    child: Column(
                      children: [
                        IncreaseDeincreaseButton(),
                        SpacerUtility.smallXXX,
                        TitleMedium1(
                          text: "200.00 ₺",
                        )
                      ],
                    ),
                  )
                ]),
          ),
        ),
        BasketDivider()
      ],
    );
  }
}

class IncreaseDeincreaseButton extends StatelessWidget {
  const IncreaseDeincreaseButton({
    super.key,
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
            children: [IncreaseButton(), CountText(), DeincreaseButton()]),
      ),
    );
  }
}

class CountText extends StatelessWidget {
  const CountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LabelLarge4(
      text: "2",
    );
  }
}

class DeincreaseButton extends StatelessWidget {
  const DeincreaseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtility.mediumX.h,
      width: SizeUtility.mediumX.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero, backgroundColor: ColorUtility.textColorGrey, shape: CircleBorder()),
          onPressed: () {},
          child: Icon(
            Icons.add_rounded,
            color: ColorUtility.whiteColor,
            size: SizeUtility.mediumxX.w,
          )),
    );
  }
}

class IncreaseButton extends StatelessWidget {
  const IncreaseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtility.mediumX.h,
      width: SizeUtility.mediumX.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero, backgroundColor: ColorUtility.textColorGrey, shape: CircleBorder()),
          onPressed: () {},
          child: Icon(
            Icons.remove_rounded,
            color: ColorUtility.whiteColor,
            size: SizeUtility.mediumxX.w,
          )),
    );
  }
}

class BasketDivider extends StatelessWidget {
  const BasketDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: ColorUtility.avatarColorGrey,
    );
  }
}

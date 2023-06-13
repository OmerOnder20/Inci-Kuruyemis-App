import 'package:flutter/material.dart';
import 'package:inci_kuruyemis/product/widgets/texts/label/label_large_5.dart';

import '../../utility/colors/color_utility.dart';
import '../../utility/sizes/widget_size.dart';

class GramajButton extends StatelessWidget {
  const GramajButton({
    super.key,
    this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: WidgetSizes.detailSheetButtonHeight,
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(foregroundColor: ColorUtility.textColorGrey, padding: EdgeInsets.zero),
          onPressed: onPressed,
          child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: LabelLarge5(text: text),
              )),
        ));
  }
}

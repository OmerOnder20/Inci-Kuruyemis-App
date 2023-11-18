import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../product/controller/user_controller.dart';
import '../../../product/navigator/app_router.dart';
import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../product/utility/sizes/widget_size.dart';

class BasketFloatingActionButton extends StatelessWidget {
  const BasketFloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSizes.basketFloatingActionButtonHeight,
      width: WidgetSizes.basketFloatingActionButtonWidth,
      child: FloatingActionButton.extended(
        highlightElevation: 1,
        focusElevation: 1,
        elevation: 1,
        splashColor: ColorUtility.yellowColor,
        backgroundColor: Colors.amber,
        onPressed: () {
          context.router.navigate(const SatinAlmaRoute());
        },
        label: RichText(
            text: TextSpan(
                style: GoogleFonts.poppins(
                    letterSpacing: -1,
                    color: ColorUtility.blackColor,
                    fontWeight: FontWeight.w600,
                    textStyle: Theme.of(context).textTheme.bodyLarge),
                text: "${context.watch<CartController>().sepetFiyati} ₺",
                children: [
              TextSpan(
                  text: StringConstants.sepetiOnayla,
                  style: GoogleFonts.poppins(
                      letterSpacing: 0,
                      color: ColorUtility.whiteColor,
                      fontWeight: FontWeight.w600,
                      textStyle: Theme.of(context).textTheme.bodyLarge))
            ])),
      ),
    );
  }
}

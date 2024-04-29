import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_medium_1.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_small_1.dart';
import 'package:provider/provider.dart';

import '../../../product/controller/cart_controller.dart';
import '../../../product/navigator/app_router.dart';
import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../product/utility/sizes/widget_size.dart';

class BasketFloatingActionButton extends StatelessWidget {
  const BasketFloatingActionButton();

  @override
  Widget build(BuildContext context) {
    final sepetController = Provider.of<CartController>(
      context,
      listen: false,
    );
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
          if (sepetController.sepetUrunSayisi != 0) {
            context.router.navigate(const SatinAlmaRoute());
          }
          if (sepetController.sepetUrunSayisi == 0) {
            showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 45.w, vertical: 20.h),
                title: const Center(
                    child: TitleMedium1(
                  text: StringConstants.sepetBos,
                )),
                backgroundColor: ColorUtility.scaffoldBackGroundColor,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Colors.amber,
                    ),
                    onPressed: () {
                      context.router.push(const AnaSayfaRoute());
                    },
                    child:
                        const TitleSmall1(text: StringConstants.alisverisBasla),
                  )
                ],
              ),
            );
          }
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

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inci_kuruyemis/feature/sepet/widgets/basket_app_bar.dart';
import 'package:inci_kuruyemis/feature/sepet/widgets/basket_product_column.dart';

import '../../product/utility/colors/color_utility.dart';
import '../../product/utility/constants/string_constants.dart';
import '../../product/utility/sizes/widget_size.dart';

@RoutePage()
class SepetView extends StatefulWidget {
  const SepetView({super.key});

  @override
  State<SepetView> createState() => _SepetViewState();
}

class _SepetViewState extends State<SepetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: BasketFloatingActionButton(),
      appBar: BasketAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.infinity,
          child: BasketListViewBuilder(),
        ),
      ),
    );
  }
}

class BasketListViewBuilder extends StatelessWidget {
  const BasketListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 8,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return BasketProductColumn();
      },
    );
  }
}

class BasketFloatingActionButton extends StatelessWidget {
  const BasketFloatingActionButton({
    super.key,
  });

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
        onPressed: () {},
        label: RichText(
            text: TextSpan(
                style: GoogleFonts.poppins(
                    letterSpacing: -1,
                    color: ColorUtility.blackColor,
                    fontWeight: FontWeight.w600,
                    textStyle: Theme.of(context).textTheme.bodyLarge),
                text: "300.00 ₺",
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

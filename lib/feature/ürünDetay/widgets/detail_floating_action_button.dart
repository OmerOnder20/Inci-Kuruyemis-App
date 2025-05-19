import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/navigator/app_router.dart';
import 'package:provider/provider.dart';
import '../../../product/controller/cart_controller.dart';
import '../../../product/models/ürün_model.dart';
import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../core/size/sizes.dart';
import '../../../product/utility/sizes/widget_size.dart';
import '../../../product/widgets/text/label/label_medium_5.dart';
import '../../../product/widgets/text/title/title_medium_1.dart';

class DetailFloatingActionButton extends StatefulWidget {
  final Products products;
  const DetailFloatingActionButton(this.products);

  @override
  State<DetailFloatingActionButton> createState() =>
      _DetailFloatingActionButtonState();
}

class _DetailFloatingActionButtonState
    extends State<DetailFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<CartController>(
      context,
      listen: false,
    );
    return SizedBox(
      height: WidgetSizes.detailFloatingActionButtonHeight,
      width: WidgetSizes.detailFloatingActionButtonWidth,
      child: FloatingActionButton.extended(
        heroTag: null,
        highlightElevation: 1,
        focusElevation: 1,
        elevation: 1,
        splashColor: ColorUtility.yellowColor,
        backgroundColor: Colors.amber,
        onPressed: () {
          userController.sepeteUrunuEkle(widget.products);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: ColorUtility.yellowColor,
              elevation: 4,
              duration: Duration(seconds: 3),
              behavior: SnackBarBehavior.fixed,
              content: TitleMedium1(text: StringConstants.urunEklendi)));
          context.router.pushAndPopUntil(
            const AnaSayfaRoute(),
            predicate: (route) => false,
          );
        },
        label: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LabelMedium5(
              text: StringConstants.sepeteEkle,
            ),
            SizedBox(
              width: 5.w,
            ),
            Icon(Icons.shopping_cart_rounded,
                color: ColorUtility.whiteColor, size: SizeUtility.mediumx)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../product/controller/user_controller.dart';
import '../../../product/models/ürün_model.dart';
import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../product/utility/sizes/sizes.dart';
import '../../../product/utility/sizes/widget_size.dart';
import '../../../product/widgets/text/label/label_medium_5.dart';
import '../../../product/widgets/text/title/title_medium_1.dart';

class DetailFloatingActionButton extends StatelessWidget {
  final Products products;
  const DetailFloatingActionButton(this.products);

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<CartController>(context, listen: false);
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
          if (userController.sepetItems.contains(products)) {
            userController.urunAdetArtma(products);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: ColorUtility.yellowColor,
                elevation: 4,
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.fixed,
                content: TitleMedium1(text: StringConstants.urunEklendi)));
          } else {
            userController.sepeteUrunuEkle(products);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: ColorUtility.yellowColor,
                elevation: 4,
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.fixed,
                content: TitleMedium1(text: StringConstants.urunEklendi)));
          }
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

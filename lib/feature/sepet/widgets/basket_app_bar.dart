import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inci_kuruyemis/product/controller/cart_controller.dart';
import 'package:provider/provider.dart';

import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/asset_constants.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../product/utility/sizes/sizes.dart';
import '../../../product/utility/sizes/widget_size.dart';
import '../../../product/widgets/appBar/custom_app_bar.dart';
import '../../../product/widgets/text/title/title_medium_1.dart';
import '../../../product/widgets/text/title/title_small_1.dart';

class BasketAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasketAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(
        title: StringConstants.sepetim, actions: [DeleteButton()]);
  }

  @override
  Size get preferredSize => Size.fromHeight(WidgetSizes.customAppBarHeight);
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30.h,
        right: 18.w,
      ),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 45.w, vertical: 50.h),
              title: const Center(
                  child: TitleMedium1(
                text: StringConstants.sepetUrunKaldirma,
              )),
              backgroundColor: ColorUtility.scaffoldBackGroundColor,
              children: [
                const Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RemoveEvet(),
                      SizedBox(
                        width: 20,
                      ),
                      RemoveHayir(),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        child: SvgPicture.asset(
          AssetConstants.deleteSvg,
          height: SizeUtility.mediumx,
          width: SizeUtility.mediumx,
        ),
      ),
    );
  }
}

class RemoveHayir extends StatelessWidget {
  const RemoveHayir({
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

class RemoveEvet extends StatelessWidget {
  const RemoveEvet({
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
        context.read<CartController>().removeAllSepet();
      },
      child: const TitleSmall1(text: StringConstants.evet),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../product/utility/constants/asset_constants.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../product/utility/sizes/sizes.dart';
import '../../../product/utility/sizes/widget_size.dart';
import '../../../product/widgets/appBar/custom_app_bar.dart';

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
        onTap: () {},
        child: SvgPicture.asset(
          AssetConstants.deleteSvg,
          height: SizeUtility.mediumx,
          width: SizeUtility.mediumx,
        ),
      ),
    );
  }
}

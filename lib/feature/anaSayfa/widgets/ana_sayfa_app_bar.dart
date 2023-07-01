import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/asset_constants.dart';
import '../../../product/utility/sizes/sizes.dart';
import '../../../product/utility/sizes/widget_size.dart';

class AnaSayfaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnaSayfaAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      centerTitle: true,
      backgroundColor: ColorUtility.yellowColor,
      actions: const [NotificationStack()],
      title: SvgPicture.asset(
        AssetConstants.logoSvg,
        height: WidgetSizes.anaSayfaLogoHeightAndWidth,
        width: WidgetSizes.anaSayfaLogoHeightAndWidth,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(WidgetSizes.anaSayfaAppBarHeight);
}

class NotificationStack extends StatelessWidget {
  const NotificationStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 26.h, right: 16.w),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Stack(
          children: [
            SvgPicture.asset(
              AssetConstants.notificationSvg,
              height: SizeUtility.mediumX,
              width: SizeUtility.mediumX,
              fit: BoxFit.cover,
            ),
            const Positioned(
              right: 2,
              child: HasNotification(),
            )
          ],
        ),
      ),
    );
  }
}

class HasNotification extends StatelessWidget {
  const HasNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration:
          const BoxDecoration(color: Color(0xffD83C00), shape: BoxShape.circle),
    );
  }
}

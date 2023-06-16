import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:inci_kuruyemis/product/utility/sizes/widget_size.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_small_1.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
  });
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      actions: actions,
      elevation: 1,
      backgroundColor: ColorUtility.yellowColor,
      title: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: TitleSmall1(text: title),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(WidgetSizes.customAppBarHeight);
}

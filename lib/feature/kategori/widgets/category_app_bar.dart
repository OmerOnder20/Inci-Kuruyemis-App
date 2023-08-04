import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:inci_kuruyemis/product/utility/sizes/widget_size.dart';
import 'package:inci_kuruyemis/product/widgets/button/pop_button.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_small_3.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_small_1.dart';

class CategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final int? count;
  const CategoryAppBar({
    super.key,
    this.title,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 1,
      backgroundColor: ColorUtility.yellowColor,
      leading: const PopButton(),
      title: Padding(
        padding: EdgeInsets.only(top: 18.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleSmall1(text: title.toString()),
            LabelSmall3(text: "${count} sonuç bulundu"),
          ],
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(WidgetSizes.customAppBarHeight);
}

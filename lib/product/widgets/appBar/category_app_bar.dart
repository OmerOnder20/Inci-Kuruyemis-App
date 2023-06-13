import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:inci_kuruyemis/product/utility/sizes/widget_size.dart';
import 'package:inci_kuruyemis/product/widgets/button/pop_button.dart';

class CategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoryAppBar({
    super.key,
    required this.title,
    required this.countTitle,
  });
  final String title;
  final String countTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 1,
      backgroundColor: ColorUtility.yellowColor,
      leading: PopButton(),
      title: Padding(
        padding: EdgeInsets.only(top: 18.h),
        child: TitleColumn(title: title, countTitle: countTitle),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(WidgetSizes.customAppBarHeight);
}

class TitleColumn extends StatelessWidget {
  const TitleColumn({
    super.key,
    required this.title,
    required this.countTitle,
  });

  final String title;
  final String countTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            textStyle: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Text(
          countTitle,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            letterSpacing: 0,
            height: 0,
            color: Colors.white,
            textStyle: Theme.of(context).textTheme.labelSmall,
          ),
        )
      ],
    );
  }
}

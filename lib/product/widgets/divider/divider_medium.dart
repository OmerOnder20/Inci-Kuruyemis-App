import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';

class DividerMedium extends StatelessWidget {
  const DividerMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      width: double.infinity,
      color: ColorUtility.avatarColorGrey,
    );
  }
}

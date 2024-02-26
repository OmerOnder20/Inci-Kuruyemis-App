import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';

class DividerHuge extends StatelessWidget {
  const DividerHuge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 2,
      color: ColorUtility.textColorGrey,
    );
  }
}

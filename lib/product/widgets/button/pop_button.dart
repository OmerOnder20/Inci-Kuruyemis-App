import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/colors/color_utility.dart';

class PopButton extends StatelessWidget {
  const PopButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 5.w,
      ),
      child: IconButton(
          highlightColor: ColorUtility.yellowColor,
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          alignment: Alignment.bottomLeft,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: ColorUtility.whiteColor,
            size: 24.h,
          )),
    );
  }
}

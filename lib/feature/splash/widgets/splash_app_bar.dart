import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../product/utility/colors/color_utility.dart';

class SplashAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SplashAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: ColorUtility.yellowColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}

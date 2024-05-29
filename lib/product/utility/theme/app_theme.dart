import 'package:flutter/material.dart';

import '../colors/color_utility.dart';
import 'app_bar_theme.dart';

class InciAppTheme {
  final ThemeData inciAppTheme = ThemeData(
      scaffoldBackgroundColor: ColorUtility.scaffoldBackGroundColor,
      appBarTheme: InciAppBarTheme().inciAppBarTheme,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.transparent,
      ));
}

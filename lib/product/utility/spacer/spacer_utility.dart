import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class SpacerUtility {
  const SpacerUtility._();

  static final Widget small = SizedBox(height: 5.h);
  static final Widget smallX = SizedBox(height: 10.h);
  static final Widget smallXX = SizedBox(height: 15.h);
  static final Widget smallXXX = SizedBox(height: 20.h);
  static final Widget medium = SizedBox(height: 25.h);
  static final Widget mediumX = SizedBox(height: 30.h);
  static final Widget mediumXX = SizedBox(height: 35.h);
  static final Widget mediumXXX = SizedBox(height: 40.h);
  static final Widget large = SizedBox(height: 45.h);
  static final Widget largeX = SizedBox(height: 50.h);
  static final Widget largeXX = SizedBox(height: 55.h);
  static final Widget largeXXX = SizedBox(height: 60.h);
  static final Widget huge = SizedBox(height: 250.h);
}

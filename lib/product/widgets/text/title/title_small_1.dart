import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utility/colors/color_utility.dart';

class TitleSmall1 extends StatelessWidget {
  const TitleSmall1({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          letterSpacing: 0,
          color: ColorUtility.whiteColor,
          fontWeight: FontWeight.w600,
          textStyle: Theme.of(context).textTheme.titleSmall),
    );
  }
}

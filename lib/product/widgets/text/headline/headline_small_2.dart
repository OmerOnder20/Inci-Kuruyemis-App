import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utility/colors/color_utility.dart';

class HeadlineSmall2 extends StatelessWidget {
  const HeadlineSmall2({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          letterSpacing: 0,
          color: ColorUtility.textColorBlack,
          fontWeight: FontWeight.w500,
          textStyle: Theme.of(context).textTheme.headlineSmall),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utility/colors/color_utility.dart';

class LabelLarge3 extends StatelessWidget {
  const LabelLarge3({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      style: GoogleFonts.poppins(
          letterSpacing: 0,
          height: 1,
          color: ColorUtility.textColorBlack,
          fontWeight: FontWeight.w600,
          textStyle: Theme.of(context).textTheme.labelLarge),
    );
  }
}

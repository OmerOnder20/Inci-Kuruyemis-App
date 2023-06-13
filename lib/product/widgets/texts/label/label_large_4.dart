import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utility/colors/color_utility.dart';

class LabelLarge4 extends StatelessWidget {
  const LabelLarge4({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      style: GoogleFonts.poppins(
          letterSpacing: 0,
          color: ColorUtility.textColorGrey,
          fontWeight: FontWeight.w700,
          textStyle: Theme.of(context).textTheme.labelLarge),
    );
  }
}

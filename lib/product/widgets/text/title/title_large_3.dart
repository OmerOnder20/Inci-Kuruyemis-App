import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utility/colors/color_utility.dart';

class TitleLarge3 extends StatelessWidget {
  const TitleLarge3({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            height: 1,
            letterSpacing: 0,
            color: ColorUtility.textColorBlack,
            fontWeight: FontWeight.w700,
            textStyle: Theme.of(context).textTheme.titleLarge));
  }
}

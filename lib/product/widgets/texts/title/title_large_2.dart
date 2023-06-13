import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utility/colors/color_utility.dart';

class TitleLarge2 extends StatelessWidget {
  const TitleLarge2({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            letterSpacing: 0,
            height: 1,
            fontStyle: FontStyle.italic,
            color: ColorUtility.textColorBlack,
            fontWeight: FontWeight.w500,
            textStyle: Theme.of(context).textTheme.titleLarge));
  }
}

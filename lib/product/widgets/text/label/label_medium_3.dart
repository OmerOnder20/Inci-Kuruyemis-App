import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utility/colors/color_utility.dart';

class LabelMedium3 extends StatelessWidget {
  const LabelMedium3({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            letterSpacing: 0,
            height: 1,
            color: ColorUtility.textColorGrey,
            fontWeight: FontWeight.w400,
            textStyle: Theme.of(context).textTheme.labelMedium));
  }
}

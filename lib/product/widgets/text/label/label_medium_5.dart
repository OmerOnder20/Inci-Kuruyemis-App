import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utility/colors/color_utility.dart';

class LabelMedium5 extends StatelessWidget {
  const LabelMedium5({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 2,
        style: GoogleFonts.poppins(
            letterSpacing: 0,
            height: 1,
            color: ColorUtility.whiteColor,
            fontWeight: FontWeight.w600,
            textStyle: Theme.of(context).textTheme.labelMedium));
  }
}

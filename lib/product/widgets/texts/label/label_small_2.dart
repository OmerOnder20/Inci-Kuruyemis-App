import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utility/colors/color_utility.dart';

class LabelSmall2 extends StatelessWidget {
  const LabelSmall2({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(
            height: 1,
            letterSpacing: 0,
            color: ColorUtility.textColorBlack,
            fontWeight: FontWeight.w400,
            textStyle: Theme.of(context).textTheme.labelSmall));
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utility/colors/color_utility.dart';

class LabelSmall1 extends StatelessWidget {
  const LabelSmall1({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: GoogleFonts.poppins(
          letterSpacing: 0,
          color: ColorUtility.textColorBlack,
          fontWeight: FontWeight.w500,
          textStyle: Theme.of(context).textTheme.labelSmall),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utility/colors/color_utility.dart';

class LabelSmall3 extends StatelessWidget {
  const LabelSmall3({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 0,
        color: ColorUtility.whiteColor,
        textStyle: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}

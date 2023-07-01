// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utility/colors/color_utility.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType textInputType;
  final double height;
  final double width;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.height,
    required this.width,
    required this.validator,
    this.inputFormatters,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: TextFormField(
            inputFormatters: inputFormatters,
            cursorColor: ColorUtility.blackColor,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            textInputAction: TextInputAction.next,
            keyboardType: textInputType,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: GoogleFonts.poppins(
                  letterSpacing: 0,
                  color: ColorUtility.textColorGrey,
                  fontWeight: FontWeight.w400,
                  textStyle: Theme.of(context).textTheme.labelMedium),
              contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 20.w),
              filled: true,
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: ColorUtility.greyColor, width: 1.w)),
              fillColor: ColorUtility.scaffoldBackGroundColor,
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: ColorUtility.greyColor, width: 1.w)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: ColorUtility.greyColor, width: 1.w)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: ColorUtility.greyColor, width: 1.w)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: ColorUtility.greyColor, width: 1.w)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: ColorUtility.greyColor, width: 1.w)),
            )));
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:inci_kuruyemis/feature/arama/widgets/search_product_delegate.dart';
import 'package:inci_kuruyemis/product/utility/sizes/sizes.dart';

import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../product/utility/sizes/widget_size.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  const SearchTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: SizedBox(
          height: WidgetSizes.searchTextFieldHeight,
          width: double.infinity,
          child: TextField(
              cursorColor: ColorUtility.blackColor,
              textInputAction: TextInputAction.search,
              focusNode: _focusNode,
              onTap: () {
                showSearch(context: context, delegate: SearchProductDelegate(_focusNode));
              },
              controller: widget.controller,
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Icon(
                    Icons.search_rounded,
                    size: SizeUtility.mediumX,
                  ),
                ),
                prefixIconColor: ColorUtility.blackColor,
                hintText: StringConstants.urunAra,
                hintStyle: GoogleFonts.poppins(
                    letterSpacing: 0,
                    height: 1,
                    color: ColorUtility.greyColor,
                    fontWeight: FontWeight.w400,
                    textStyle: Theme.of(context).textTheme.titleSmall),
                filled: true,
                fillColor: ColorUtility.scaffoldBackGroundColor,
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: ColorUtility.greyColor, width: 0.5.w)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: ColorUtility.greyColor, width: 0.5.w)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: ColorUtility.greyColor, width: 0.5.w)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: ColorUtility.greyColor, width: 0.5.w)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: ColorUtility.greyColor, width: 0.5.w)),
              )),
        ));
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inci_kuruyemis/product/navigator/app_router.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';

import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/sizes/sizes.dart';
import '../../../product/utility/sizes/widget_size.dart';

class SearchProductDelegate extends SearchDelegate {
  final FocusNode focusNode;

  List<String> nutItems = [
    "Antep Fıstığı",
    "Kavrulmuş Fındık",
    "Kavrulmuş Badem",
    "Kavrulmuş Yer Fıstığı",
    "Ayçekirdeği",
    "Lüks Karışık",
    "Çiğ Karışık",
  ];

  SearchProductDelegate(
    this.focusNode,
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear_rounded,
              color: ColorUtility.blackColor, size: SizeUtility.mediumX))
    ];
  }

  //Burayı veli bacıktan tekrardan izle. <T> type kısmına bak ve dıger kısımları da izle.
  @override
  Widget? buildLeading(
    BuildContext context,
  ) {
    return IconButton(
        onPressed: () {
          close(context, null);
          context.router.pop();

          FocusScope.of(context).unfocus();
        },
        icon: Icon(Icons.arrow_back_rounded,
            color: ColorUtility.blackColor, size: SizeUtility.mediumX));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> searchItems = [];
    for (var item in nutItems) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        searchItems.add(item);
      }
    }
    return ListView.builder(
      itemCount: searchItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              height: 1,
              width: double.infinity,
              color: ColorUtility.avatarColorGrey,
            ),
            InkWell(
              onTap: () {
                context.router.navigate(UrunDetayRoute());
                context.router.pop();

                FocusScope.of(context).unfocus();
              },
              child: ListTile(
                title: Text(searchItems[index]),
                trailing: Container(
                  height: SizeUtility.largeXX.h,
                  width: SizeUtility.largeXX.w,
                  decoration: const BoxDecoration(
                      color: ColorUtility.yellowColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: ColorUtility.whiteColor,
                    size: SizeUtility.mediumX,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchItems = [];
    for (var item in nutItems) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        searchItems.add(item);
      }
    }
    return ListView.builder(
      itemCount: searchItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              height: 1,
              width: double.infinity,
              color: ColorUtility.avatarColorGrey,
            ),
            InkWell(
              onTap: () {
                context.router.navigate(UrunDetayRoute());
                context.router.pop();

                FocusScope.of(context).unfocus();
              },
              child: ListTile(
                title: Text(searchItems[index]),
                trailing: Container(
                  height: SizeUtility.largeXX.h,
                  width: SizeUtility.largeXX.w,
                  decoration: const BoxDecoration(
                      color: ColorUtility.yellowColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: ColorUtility.whiteColor,
                    size: SizeUtility.mediumX,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
              titleLarge: GoogleFonts.poppins(
                  letterSpacing: 0,
                  height: 1,
                  color: ColorUtility.blackColor,
                  fontWeight: FontWeight.w400,
                  textStyle: Theme.of(context).textTheme.titleSmall),
            ),
        scaffoldBackgroundColor: ColorUtility.scaffoldBackGroundColor,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: ColorUtility.blackColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: GoogleFonts.poppins(
                letterSpacing: 0,
                height: 1,
                color: ColorUtility.greyColor,
                fontWeight: FontWeight.w400,
                textStyle: Theme.of(context).textTheme.titleSmall),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: ColorUtility.greyColor, width: 0.5)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: ColorUtility.greyColor, width: 0.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: ColorUtility.greyColor, width: 0.5)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: ColorUtility.greyColor, width: 0.5)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: ColorUtility.greyColor, width: 0.5))),
        appBarTheme: AppBarTheme(
            titleSpacing: 5,
            elevation: 0,
            color: ColorUtility.scaffoldBackGroundColor,
            toolbarHeight: WidgetSizes.delegateTextFieldHeight));
  }

  @override
  String get searchFieldLabel => StringConstants.urunAra;

  @override
  TextInputType get keyboardType => TextInputType.name;

  @override
  TextInputAction get textInputAction => TextInputAction.search;
}

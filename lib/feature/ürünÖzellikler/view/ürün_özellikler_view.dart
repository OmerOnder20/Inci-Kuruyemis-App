import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';
import 'package:inci_kuruyemis/product/widgets/divider/divider_large.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_large_1.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_large_2.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../core/spacer/spacer_utility.dart';
import '../../../product/widgets/button/pop_button.dart';

class UrunOzelliklerView extends StatelessWidget {
  final String urunName;
  final String description;
  const UrunOzelliklerView(
      {super.key, required this.urunName, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: StringConstants.urunOzellikleri,
        leading: PopButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpacerUtility.mediumXXX,
                TitleLarge2(
                  text: urunName,
                ),
                SpacerUtility.smallX,
                const DividerLarge(),
                SpacerUtility.smallX,
                Align(
                  alignment: Alignment.centerLeft,
                  child: LabelLarge1(
                    text: description,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inci_kuruyemis/product/models/kategori_model.dart';

import '../../../product/utility/colors/color_utility.dart';
import '../../../product/widgets/text/label/label_small_1.dart';

class CategoryCard extends StatelessWidget {
  final KategoriModel kategoriModel;
  const CategoryCard({
    super.key,
    required this.kategoriModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      color: ColorUtility.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: EdgeInsets.only(
          top: 10.h,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: SvgPicture.network(
                    kategoriModel.image?.path.toString() ?? ""),
                radius: 34.r,
                backgroundColor: ColorUtility.whiteColor,
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 15, right: 20),
                  child: LabelSmall1(
                    text: kategoriModel.name.toString(),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}

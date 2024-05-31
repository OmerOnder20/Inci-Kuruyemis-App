import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/sizes/sizes.dart';
import '../../../product/widgets/text/label/label_small_2.dart';

class ProductCard extends StatelessWidget {
  final String? urunAdi;
  final String? imageUrl;
  final void Function()? onPressed;
  const ProductCard({
    Key? key,
    this.urunAdi,
    this.imageUrl,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      color: ColorUtility.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(alignment: Alignment.topRight, children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 50.h,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: NetworkImage(
                      imageUrl ?? "",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: LabelSmall2(text: urunAdi ?? ""),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
          child: SizedBox(
            height: SizeUtility.mediumXx.h,
            width: SizeUtility.mediumXx.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorUtility.blackColor,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    shape: const CircleBorder()),
                onPressed: onPressed,
                child: Icon(
                  Icons.add,
                  size: 15.h,
                  color: ColorUtility.whiteColor,
                )),
          ),
        ),
      ]),
    );
  }
}

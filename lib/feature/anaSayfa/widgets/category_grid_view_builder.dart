import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/viewModel/ana_sayfa_provider.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/widgets/category_card.dart';
import 'package:inci_kuruyemis/product/navigator/app_router.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CategoryGridViewBuilder extends StatelessWidget {
  const CategoryGridViewBuilder();

  @override
  Widget build(BuildContext context) {
    return Consumer<AnaSayfaProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: provider.isLoading ? 3 : provider.kategoriItems?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 0.87),
            itemBuilder: (context, index) {
              if (provider.isLoading) {
                return Card(
                  elevation: 1,
                  margin: EdgeInsets.zero,
                  color: ColorUtility.whiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: CircleAvatar(
                              radius: 34.r,
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 15.h, left: 15, right: 10),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  width: double.infinity,
                                  height: 10.h,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                );
              }
              return InkWell(
                highlightColor: ColorUtility.scaffoldBackGroundColor,
                onTap: () {
                  context.router.push(KategoriRoute(
                      categoryId: provider.kategoriItems?[index].id ?? 0,
                      categoryName: provider.kategoriItems?[index].name ?? ""));
                },
                child: CategoryCard(
                  categoryname: provider.kategoriItems?[index].name ?? "",
                  imagePath: provider.kategoriItems?[index].image?.path ?? "",
                ),
              );
            },
          ),
        );
      },
    );
  }
}

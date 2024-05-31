import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/kategori/widgets/product_card.dart';
import 'package:inci_kuruyemis/feature/kategori/widgets/category_app_bar.dart';
import 'package:inci_kuruyemis/product/models/%C3%BCr%C3%BCn_model.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:inci_kuruyemis/product/utility/sizes/sizes.dart';
import 'package:shimmer/shimmer.dart';
import '../../ürünDetay/view/ürün_detay_view.dart';
import '../viewModel/kategori_view_model.dart';

@RoutePage()
class KategoriView extends StatefulWidget {
  final String categoryName;
  final int categoryId;
  const KategoriView({
    super.key,
    @PathParam() required this.categoryName,
    @PathParam() required this.categoryId,
  });

  @override
  State<KategoriView> createState() => _KategoriViewState();
}

class _KategoriViewState extends KategoriViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppBar(
        title: widget.categoryName,
        count: urunItems?.length ?? 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: isLoading ? 3 : urunItems?.length ?? 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 8.w,
                  childAspectRatio: 2.7 / 4),
              itemBuilder: (context, index) {
                if (isLoading == true) {
                  return Card(
                    elevation: 1,
                    margin: EdgeInsets.zero,
                    color: ColorUtility.whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
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
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: CircleAvatar(
                                    radius: 50.h,
                                    backgroundColor: ColorUtility.whiteColor,
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
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 5.w),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                shape: BoxShape.circle),
                            height: SizeUtility.mediumXx.h,
                            width: SizeUtility.mediumXx.w,
                          ),
                        ),
                      ),
                    ]),
                  );
                }
                return ProductCard(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UrunDetayView(
                        products: Products(
                            isShown: urunItems?[index].isShown ?? false,
                            variationIndex:
                                urunItems?[index].variationIndex ?? 0,
                            description: urunItems?[index].description,
                            images: urunItems?[index].images,
                            id: urunItems?[index].id,
                            name: urunItems?[index].name,
                            variations: urunItems?[index].variations ?? []),
                      ),
                    ));
                  },
                  urunAdi: urunItems?[index].name ?? "",
                  imageUrl: urunItems?[index].images?[0].path.toString(),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

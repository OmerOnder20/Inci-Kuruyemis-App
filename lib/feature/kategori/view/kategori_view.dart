import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/kategori/widgets/product_card.dart';
import 'package:inci_kuruyemis/feature/kategori/widgets/category_app_bar.dart';
import 'package:inci_kuruyemis/product/models/%C3%BCr%C3%BCn_model.dart';

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
          isLoading
              ? const CircularProgressIndicator()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: urunItems?.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 8.w,
                        childAspectRatio: 2.7 / 4),
                    itemBuilder: (context, index) {
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
                                  variations:
                                      urunItems?[index].variations ?? []),
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

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/kategori/widgets/product_card.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/category_app_bar.dart';

@RoutePage()
class KategoriView extends StatefulWidget {
  const KategoriView({super.key});

  @override
  State<KategoriView> createState() => _KategoriViewState();
}

class _KategoriViewState extends State<KategoriView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppBar(title: "Kuruyemiş,Çerez", countTitle: "36 sonuç bulundu"),
      body: SingleChildScrollView(
        child: Column(children: [ProductGridViewBuilder()]),
      ),
    );
  }
}

class ProductGridViewBuilder extends StatelessWidget {
  const ProductGridViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 16,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 16.h, crossAxisSpacing: 8.w, childAspectRatio: 2.7 / 4),
        itemBuilder: (context, index) {
          return ProductCard();
        },
      ),
    );
  }
}

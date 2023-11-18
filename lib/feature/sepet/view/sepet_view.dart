import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inci_kuruyemis/feature/sepet/widgets/basket_app_bar.dart';
import 'package:inci_kuruyemis/feature/sepet/widgets/basket_product_column.dart';
import 'package:inci_kuruyemis/product/controller/user_controller.dart';
import 'package:provider/provider.dart';

import '../widgets/basket_floating_action_button.dart';

@RoutePage()
class SepetView extends StatefulWidget {
  const SepetView({super.key});

  @override
  State<SepetView> createState() => _SepetViewState();
}

class _SepetViewState extends State<SepetView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: BasketFloatingActionButton(),
      appBar: BasketAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.infinity,
          child: _BasketListViewBuilder(),
        ),
      ),
    );
  }
}

class _BasketListViewBuilder extends StatelessWidget {
  const _BasketListViewBuilder();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: context.watch<CartController>().sepetItems.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        final products = context.watch<CartController>().sepetItems[index];

        return BasketProductColumn(
            products: products,
            productCount:
                context.watch<CartController>().sepetUrunleri[products] ?? 0,
            imageUrl: products.images?[0].path ?? "",
            productName: products.name ?? "",
            variationName:
                products.variations?[products.variationIndex].name ?? "",
            variationPrice:
                products.variations?[products.variationIndex].price ?? "");
      },
    );
  }
}

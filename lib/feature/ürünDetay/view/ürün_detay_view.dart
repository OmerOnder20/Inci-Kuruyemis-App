import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/%C3%BCr%C3%BCnDetay/widgets/detail_column.dart';
import 'package:inci_kuruyemis/feature/%C3%BCr%C3%BCnDetay/widgets/detail_info_row.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/product/utility/spacer/spacer_utility.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';

import '../../../product/models/ürün_model.dart';
import '../../../product/utility/colors/color_utility.dart';
import '../../../product/widgets/button/pop_button.dart';
import '../widgets/detail_floating_action_button.dart';
import '../widgets/product_column.dart';

class UrunDetayView extends StatefulWidget {
  final Products products;
  UrunDetayView({
    super.key,
    required this.products,
  });

  @override
  State<UrunDetayView> createState() => _UrunDetayViewState();
}

class _UrunDetayViewState extends State<UrunDetayView> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: DetailFloatingActionButton(widget.products),
      appBar: const CustomAppBar(
        title: StringConstants.urunDetayi,
        leading: PopButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              DetailColumn(
                products: widget.products,
                controller: _controller,
              ),
              SpacerUtility.smallXXX,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: DetailDividerOne(),
              ),
              SpacerUtility.smallXX,
              DetailInfoRow(products: widget.products),
              SpacerUtility.smallX,
              const DetailDividerOne(),
              SpacerUtility.smallX,
              ProductColumn(
                products: widget.products,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailDividerOne extends StatelessWidget {
  const DetailDividerOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.h,
      width: double.infinity,
      color: ColorUtility.avatarColorGrey,
    );
  }
}

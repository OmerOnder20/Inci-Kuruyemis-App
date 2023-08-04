import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/viewModel/ana_sayfa_provider.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/widgets/ana_sayfa_app_bar.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/widgets/category_card.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/widgets/page_stack.dart';
import 'package:inci_kuruyemis/product/models/kategori_model.dart';
import 'package:provider/provider.dart';

import '../../../product/navigator/app_router.dart';
import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/spacer/spacer_utility.dart';

@RoutePage()
class AnaSayfaView extends StatefulWidget {
  const AnaSayfaView({super.key});

  @override
  State<AnaSayfaView> createState() => _AnaSayfaViewState();
}

class _AnaSayfaViewState extends State<AnaSayfaView> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AnaSayfaAppBar(),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacerUtility.mediumXXX,
              PageStack(controller: _controller),
              context.watch<AnaSayfaProvider>().isLoading
                  ? const CircularProgressIndicator()
                  : const _CategoryGridViewBuilder(),
            ]),
      ),
    );
  }
}

class _CategoryGridViewBuilder extends StatelessWidget {
  const _CategoryGridViewBuilder();

  @override
  Widget build(BuildContext context) {
    return Consumer<AnaSayfaProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: provider.kategoriItems?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 0.87),
            itemBuilder: (context, index) {
              return InkWell(
                highlightColor: ColorUtility.scaffoldBackGroundColor,
                onTap: () {
                  context.router.push(KategoriRoute(
                      categoryId: provider.kategoriItems?[index].id ?? 0,
                      categoryName: provider.kategoriItems?[index].name ?? ""));
                },
                child: CategoryCard(
                  kategoriModel: KategoriModel(
                      name: provider.kategoriItems?[index].name,
                      image: provider.kategoriItems?[index].image),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/widgets/ana_sayfa_app_bar.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/widgets/category_card.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/widgets/page_stack.dart';

import '../../product/utility/spacer/spacer_utility.dart';

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
        child:
            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          SpacerUtility.mediumXXX,
          PageStack(controller: _controller),
          CategoryGridViewBuilder(),
        ]),
      ),
    );
  }
}

class CategoryGridViewBuilder extends StatelessWidget {
  const CategoryGridViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10.h, crossAxisSpacing: 10.w, childAspectRatio: 0.87),
        itemBuilder: (context, index) {
          return CategoryCard();
        },
      ),
    );
  }
}

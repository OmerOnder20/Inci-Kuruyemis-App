import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/widgets/ana_sayfa_app_bar.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/widgets/category_grid_view_builder.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/widgets/page_stack.dart';
import 'package:inci_kuruyemis/product/controller/internet_controller.dart';
import 'package:provider/provider.dart';
import '../../../core/spacer/spacer_utility.dart';

@RoutePage()
class AnaSayfaView extends StatefulWidget {
  const AnaSayfaView({super.key});

  @override
  State<AnaSayfaView> createState() => _AnaSayfaViewState();
}

class _AnaSayfaViewState extends State<AnaSayfaView> {
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<InternetController>(context, listen: false)
            .getConnectivity(context));
  }

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
              const CategoryGridViewBuilder(),
            ]),
      ),
    );
  }
}

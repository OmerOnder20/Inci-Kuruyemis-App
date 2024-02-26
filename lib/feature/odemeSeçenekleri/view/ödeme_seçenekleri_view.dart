import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/odemeSe%C3%A7enekleri/viewModel/%C3%B6deme_se%C3%A7enekleri_provider.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/product/utility/spacer/spacer_utility.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';
import 'package:inci_kuruyemis/product/widgets/button/pop_button.dart';
import 'package:inci_kuruyemis/product/widgets/divider/divider_large.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_large_1.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_large_2.dart';
import 'package:provider/provider.dart';

@RoutePage()
class OdemeSecenekleriView extends StatefulWidget {
  const OdemeSecenekleriView({super.key});

  @override
  State<OdemeSecenekleriView> createState() => _OdemeSecenekleriViewState();
}

class _OdemeSecenekleriViewState extends State<OdemeSecenekleriView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: StringConstants.odemeSecenekleri, leading: PopButton()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpacerUtility.mediumXXX,
                const TitleLarge2(
                  text: StringConstants.odemeSecenekleri,
                ),
                SpacerUtility.smallX,
                const DividerLarge(),
                SpacerUtility.smallX,
                Align(
                  alignment: Alignment.centerLeft,
                  child: context.watch<OdemeProvider>().isLoading
                      ? const CircularProgressIndicator.adaptive()
                      : LabelLarge1(
                          text: (context.watch<OdemeProvider>().odemeItem ?? "")
                              .replaceAll(RegExp(r'<[^>]*>'), ''),
                        ),
                )
              ]),
        ),
      ),
    );
  }
}

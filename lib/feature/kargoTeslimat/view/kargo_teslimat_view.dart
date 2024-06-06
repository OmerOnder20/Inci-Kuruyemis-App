import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/kargoTeslimat/viewModel/kargo_teslimat_provider.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/core/spacer/spacer_utility.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';
import 'package:inci_kuruyemis/product/widgets/button/pop_button.dart';
import 'package:inci_kuruyemis/product/widgets/divider/divider_large.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_large_1.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_large_2.dart';
import 'package:provider/provider.dart';

@RoutePage()
class KargoTeslimatView extends StatefulWidget {
  const KargoTeslimatView({super.key});

  @override
  State<KargoTeslimatView> createState() => _KargoTeslimatViewState();
}

class _KargoTeslimatViewState extends State<KargoTeslimatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: StringConstants.kargoVeTeslimat, leading: PopButton()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpacerUtility.mediumXXX,
                const TitleLarge2(
                  text: StringConstants.kargoVeTeslimat,
                ),
                SpacerUtility.smallX,
                const DividerLarge(),
                SpacerUtility.smallX,
                Align(
                  alignment: Alignment.centerLeft,
                  child: context.watch<KargoProvider>().isLoading
                      ? const CircularProgressIndicator.adaptive()
                      : LabelLarge1(
                          text: (context.watch<KargoProvider>().teslimatItem ??
                                  "")
                              .replaceAll(RegExp(r'<[^>]*>'), ''),
                        ),
                )
              ]),
        ),
      ),
    );
  }
}

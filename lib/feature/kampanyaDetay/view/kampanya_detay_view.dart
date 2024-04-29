import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';
import 'package:inci_kuruyemis/product/widgets/button/pop_button.dart';
import 'package:inci_kuruyemis/product/widgets/divider/divider_medium.dart';
import '../../../product/utility/sizes/widget_size.dart';
import '../../../product/utility/spacer/spacer_utility.dart';
import '../../../product/widgets/text/label/label_large_1.dart';
import '../../../product/widgets/text/title/title_large_1.dart';

class KampanyaDetayView extends StatefulWidget {
  final String kampanyaName;
  final String kampanyaSummary;
  final String kampanyaUrl;
  final String kampanyaDescription;
  const KampanyaDetayView({
    super.key,
    required this.kampanyaName,
    required this.kampanyaSummary,
    required this.kampanyaUrl,
    required this.kampanyaDescription,
  });

  @override
  State<KampanyaDetayView> createState() => _KampanyaDetayViewState();
}

class _KampanyaDetayViewState extends State<KampanyaDetayView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: StringConstants.kampanyaDetay,
        leading: PopButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SpacerUtility.mediumX,
            SizedBox(
              height: WidgetSizes.campaignCardImageHeight,
              width: WidgetSizes.campaignDetailCardWidth,
              child: Card(
                elevation: 1,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: WidgetSizes.campaignCardImageHeight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(widget.kampanyaUrl),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            SpacerUtility.smallXXX,
            TitleLarge1(text: widget.kampanyaName),
            SpacerUtility.smallX,
            const DividerMedium(),
            SpacerUtility.smallX,
            LabelLarge1(
                text: (widget.kampanyaDescription)
                    .replaceAll(RegExp(r'<[^>]*>'), '')),
          ]),
        ),
      ),
    );
  }
}

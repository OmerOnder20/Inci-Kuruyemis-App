import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';
import 'package:inci_kuruyemis/product/widgets/button/pop_button.dart';

import '../../product/utility/colors/color_utility.dart';
import '../../product/utility/sizes/widget_size.dart';
import '../../product/utility/spacer/spacer_utility.dart';
import '../../product/widgets/texts/label/label_large_1.dart';
import '../../product/widgets/texts/title/title_large_1.dart';

@RoutePage()
class KampanyaDetayView extends StatefulWidget {
  const KampanyaDetayView({super.key});

  @override
  State<KampanyaDetayView> createState() => _KampanyaDetayViewState();
}

class _KampanyaDetayViewState extends State<KampanyaDetayView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: StringConstants.kampanyaDetay,
        leading: PopButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SpacerUtility.mediumX,
            SizedBox(
              height: WidgetSizes.campaignCardImageHeight,
              width: WidgetSizes.campaignDetailCardWidth,
              child: Card(
                elevation: 1,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: WidgetSizes.campaignCardImageHeight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage("assets/randomImage/delivery.jpg"), fit: BoxFit.cover)),
                ),
              ),
            ),
            SpacerUtility.smallXXX,
            TitleLarge1(text: "Kargo Bedava Kampanyası"),
            SpacerUtility.smallX,
            CampaignDetailDivider(),
            SpacerUtility.smallX,
            LabelLarge1(
              text:
                  "300.00 ₺ üzeri alışveriş yapan müşterilerimize kargo ücretsiz ve kapıda ödeme şeklimiz mevcut 300.00 ₺ üzeri alışveriş yapan müşterilerimize kargo ücretsiz ve kapıda ödeme şeklimiz mevcut 300.00 ₺ üzeri alışveriş yapan müşterilerimize kargo ücretsiz ve kapıda ödeme şeklimiz mevcut 300.00 ₺ üzeri alışveriş yapan müşterilerimize kargo ücretsiz ve kapıda ödeme şeklimiz mevcut 300.00 ₺ üzeri alışveriş yapan müşterilerimize kargo ücretsiz ve kapıda ödeme şeklimiz mevcut",
            ),
          ]),
        ),
      ),
    );
  }
}

class CampaignDetailDivider extends StatelessWidget {
  const CampaignDetailDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: ColorUtility.avatarColorGrey,
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/kampanya/widgets/campaign_card.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';

import '../../product/utility/spacer/spacer_utility.dart';

@RoutePage()
class KampanyaView extends StatefulWidget {
  const KampanyaView({super.key});

  @override
  State<KampanyaView> createState() => _KampanyaViewState();
}

class _KampanyaViewState extends State<KampanyaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: StringConstants.kampanya),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(children: [SpacerUtility.mediumX, CampaignCard()]),
        ),
      ),
    );
  }
}

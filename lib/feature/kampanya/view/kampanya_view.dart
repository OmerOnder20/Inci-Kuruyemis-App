import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/kampanya/viewModel/kampanya_view_model.dart';
import 'package:inci_kuruyemis/feature/kampanya/widgets/campaign_card.dart';
import 'package:inci_kuruyemis/feature/kampanyaDetay/view/kampanya_detay_view.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../../../product/utility/spacer/spacer_utility.dart';

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
      appBar: const CustomAppBar(title: StringConstants.kampanya),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(children: [
            SpacerUtility.mediumX,
            context.watch<KampanyaProvider>().isLoading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: context
                          .watch<KampanyaProvider>()
                          .kampanyaItems
                          .length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SpacerUtility.smallXXX;
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final kampanyaDatas = context
                            .watch<KampanyaProvider>()
                            .kampanyaItems[index];
                        return InkWell(
                          highlightColor: ColorUtility.scaffoldBackGroundColor,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => KampanyaDetayView(
                                      kampanyaName: kampanyaDatas?.name ?? "",
                                      kampanyaSummary:
                                          kampanyaDatas?.summary ?? "",
                                      kampanyaUrl:
                                          kampanyaDatas?.image?.path ?? "",
                                      kampanyaDescription:
                                          kampanyaDatas?.description ?? "",
                                    )));
                          },
                          child: CampaignCard(
                            kampanyaName: kampanyaDatas?.name ?? "",
                            kampanyaSummary: kampanyaDatas?.summary ?? "",
                            kampanyaUrl: kampanyaDatas?.image?.path ?? "",
                          ),
                        );
                      },
                    ),
                  ),
          ]),
        ),
      ),
    );
  }
}

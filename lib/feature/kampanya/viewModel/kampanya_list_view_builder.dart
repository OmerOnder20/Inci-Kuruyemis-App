import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/kampanya/viewModel/kampanya_view_model.dart';
import 'package:inci_kuruyemis/feature/kampanya/widgets/campaign_card.dart';
import 'package:inci_kuruyemis/feature/kampanyaDetay/view/kampanya_detay_view.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:inci_kuruyemis/core/size/sizes.dart';
import 'package:inci_kuruyemis/product/utility/sizes/widget_size.dart';
import 'package:inci_kuruyemis/core/spacer/spacer_utility.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class KampanyaListViewBuilder extends StatelessWidget {
  const KampanyaListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KampanyaProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return SizedBox(
            width: double.infinity,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 2, // 2 öğe için shimmer efekti göster
              separatorBuilder: (BuildContext context, int index) {
                return SpacerUtility.smallXXX;
              },
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 1,
                      margin: EdgeInsets.zero,
                      color: ColorUtility.whiteColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                          bottom: Radius.circular(5),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              height: WidgetSizes.campaignCardImageHeight,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, top: 5),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: double.infinity,
                                height: 20.h,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.h, left: 5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      width: double.infinity,
                                      height: 10.h,
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 5.h,
                                    right: 5.w,
                                    bottom: 10.h,
                                  ),
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      height: SizeUtility.mediumXX.h,
                                      width: SizeUtility.mediumXX.w,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return SizedBox(
          width: double.infinity,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: provider.kampanyaItems?.length ?? 0,
            separatorBuilder: (BuildContext context, int index) {
              return SpacerUtility.smallXXX;
            },
            itemBuilder: (BuildContext context, int index) {
              final kampanyaDatas = provider.kampanyaItems?[index];
              return InkWell(
                highlightColor: ColorUtility.scaffoldBackGroundColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => KampanyaDetayView(
                        kampanyaName: kampanyaDatas?.name ?? "",
                        kampanyaSummary: kampanyaDatas?.summary ?? "",
                        kampanyaUrl: kampanyaDatas?.image?.path ?? "",
                        kampanyaDescription: kampanyaDatas?.description ?? "",
                      ),
                    ),
                  );
                },
                child: CampaignCard(
                  kampanyaName: kampanyaDatas?.name ?? "",
                  kampanyaSummary: kampanyaDatas?.summary ?? "",
                  kampanyaUrl: kampanyaDatas?.image?.path ?? "",
                ),
              );
            },
          ),
        );
      },
    );
  }
}

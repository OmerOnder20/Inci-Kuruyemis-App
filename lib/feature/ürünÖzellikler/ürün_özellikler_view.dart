import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_large_1.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_large_2.dart';

import '../../product/utility/colors/color_utility.dart';
import '../../product/utility/constants/string_constants.dart';
import '../../product/utility/spacer/spacer_utility.dart';
import '../../product/widgets/button/pop_button.dart';

@RoutePage()
class UrunOzelliklerView extends StatefulWidget {
  const UrunOzelliklerView({super.key});

  @override
  State<UrunOzelliklerView> createState() => _UrunOzelliklerViewState();
}

class _UrunOzelliklerViewState extends State<UrunOzelliklerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: StringConstants.urunOzellikleri,
        leading: PopButton(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpacerUtility.mediumXXX,
                  TitleLarge2(
                    text: "Kavrulmuş Yer Fıstığı",
                  ),
                  SpacerUtility.smallX,
                  _OzelliklerDivider(),
                  SpacerUtility.smallX,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: LabelLarge1(
                      text:
                          "Yer fıstığı, sağlıklı yağlar ve yüksek kaliteli protein ile doludur. Güçlü bileşenleri kalp sağlığını destekler ve diyabet tedavisine yardımcı olur. Yer fıstığı faydaları, kemik ve kasları güçlendirmesi, mideyi koruması, kalp sağlığına destek olması ve kansere karşı koruyucu görev üstlenmesi olarak sıralanabilir.Fıstık B6, B9 ve E vitaminlerinin yanında; niasin, riboflavin, thiamin gibi maddeleri ve sağlık açısından oldukça faydalı olan pantotenik adında bir asit içerir. Potasyum, manganez, bakır, kalsiyum, magnezyum, demir, selenyum, çinko ise fıstığın içerdiği minerallerin bazılarıdır.Enerji veren besinlerden kuruyemişler, lezzetli atıştırmalıklar olarak ara öğün listesinin ilk sırasında yer alır. Protein, doymamış yağ asitleri açısından zengin olan kuruyemişler, bol vitamin ve mineral içerir. Doğru miktarda tüketildiklerinde karın bölgesinde yağ yakımını da yardımcı olan kuruyemişler, tok tutar.",
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

class _OzelliklerDivider extends StatelessWidget {
  const _OzelliklerDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.h,
      width: double.infinity,
      color: ColorUtility.avatarColorGrey,
    );
  }
}

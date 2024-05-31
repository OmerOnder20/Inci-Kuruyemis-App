import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/viewModel/ana_sayfa_provider.dart';
import 'package:inci_kuruyemis/feature/kampanya/viewModel/kampanya_view_model.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/product/utility/spacer/spacer_utility.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_medium_1.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class InternetController extends ChangeNotifier {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlert = false;

  void getConnectivity(BuildContext context) {
    subscription =
        Connectivity().onConnectivityChanged.listen((ConnectivityResult) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected && !isAlert) {
        showDialogBox(context);
        isAlert = true;
      }
    });
    notifyListeners();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  showDialogBox(BuildContext context) => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: ColorUtility.scaffoldBackGroundColor,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 65.w, vertical: 50.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleMedium1(text: StringConstants.baglantiYok),
              SpacerUtility.smallXX,
              const TitleMedium1(text: StringConstants.baglantiKontrol),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: ColorUtility.amberColor,
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                isAlert = false;
                //BU SAYFALARDA INT GIDERSE TEKRARDAN YUKLENMIYOR ONDAN DOLAYI
                //TEKRAR DENEME ISTEGIYLE BIRLIKTE ISTEK ATTIM KI VERILER GELSIN
                //BURAYA EXTRADAN SEPETTEKI URUNLER ISTEDIGNI DE EKLE
                //SEPETTEKI URUNLERI INTERNETTEN CEKECEGIMIZDEN DOLAYI BURAYA KOY
                context.read<AnaSayfaProvider>().fetchKategoriItems();
                context.read<KampanyaProvider>().getKampanyaDatas();
                notifyListeners();
                if (!isDeviceConnected) {
                  showDialogBox(context);
                  isAlert = true;
                  notifyListeners();
                }
              },
              child: const TitleMedium1(text: StringConstants.tekrarDene),
            )
          ],
        ),
      );
}

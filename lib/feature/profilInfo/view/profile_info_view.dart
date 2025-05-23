import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inci_kuruyemis/core/network/network_manager.dart';
import 'package:inci_kuruyemis/product/controller/global_controller.dart';
import 'package:inci_kuruyemis/product/controller/user_controller.dart';
import 'package:inci_kuruyemis/product/navigator/app_router.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_medium_3.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_large_1.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_medium_1.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/asset_constants.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../product/utility/sizes/widget_size.dart';
import '../../../core/spacer/spacer_utility.dart';
import '../../../product/widgets/item/profile_info_item.dart';
import '../../../product/widgets/text/title/title_small_1.dart';

@RoutePage()
class ProfilInfoView extends StatefulWidget {
  const ProfilInfoView({super.key});

  @override
  State<ProfilInfoView> createState() => _ProfilInfoViewState();
}

class _ProfilInfoViewState extends State<ProfilInfoView> {
  // Bunlari ilerde ProfilInfoViewModel'e al
  late final Dio dio;

  Future<void> logOut() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    var cookieJar = PersistCookieJar(
      storage: FileStorage(appDocPath + "/.cookies/"),
    );
    dio.interceptors.add(CookieManager(cookieJar));
    cookieJar.deleteAll();
  }

  @override
  void initState() {
    super.initState();
    dio = NetworkManger.instance.dio;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final globalController =
          Provider.of<GlobalController>(context, listen: false);
      if (globalController.isCompleted) {
        showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 65.w, vertical: 50.h),
            title: const Center(
                child: TitleMedium1(
              text: StringConstants.kayitOldunuz,
            )),
            backgroundColor: ColorUtility.scaffoldBackGroundColor,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.amber,
                ),
                onPressed: () {
                  globalController.changeCompleted();
                  // ignore: deprecated_member_use
                  context.router.pop();
                  context.router.navigate(const AnaSayfaRoute());
                },
                child: const TitleSmall1(text: StringConstants.alisveriseBasla),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    return Scaffold(
      appBar: const CustomAppBar(
        title: StringConstants.profilim,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: WidgetSizes.profilInfoColumn,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SpacerUtility.mediumX,
                      TitleLarge1(text: userController.name.toString()),
                      SpacerUtility.smallXX,
                      LabelMedium3(text: userController.email.toString()),
                      SpacerUtility.smallX,
                      LabelMedium3(text: userController.username.toString())
                    ],
                  )),
              Container(
                height: 10.h,
                width: double.infinity,
                color: ColorUtility.avatarColorGrey,
              ),
              ProfilInfoItem(
                onTap: () {},
                text: StringConstants.gecmisSiparislerim,
                // pageRouteInfo: AnaSayfaRoute(),
              ),
              //
              //
              //***Yeni Sayfalar ekledikçe AnaSayfaRoute kısmını doldur.
              //
              //
              ProfilInfoItem(
                onTap: () {},
                text: StringConstants.adreslerim,
              ),
              ProfilInfoItem(
                onTap: () {},
                text: StringConstants.sikcaSorular,
              ),
              ProfilInfoItem(
                onTap: () {},
                text: StringConstants.iletisim,
              ),
              ProfilInfoItem(
                onTap: () {},
                text: StringConstants.yardim,
              ),
              ProfilInfoItem(
                onTap: () {},
                text: StringConstants.hakkinda,
              ),
              ProfilInfoItem(
                text: StringConstants.cikisYap,
                onTap: () {
                  logOut();
                  context.router.replace(const ProfilRoute());
                },
              ),
              Center(
                child: SvgPicture.asset(
                  AssetConstants.logoSvg,
                  height: WidgetSizes.profilInfoItemSvgHeightAndWidth,
                  width: WidgetSizes.profilInfoItemSvgHeightAndWidth,
                  fit: BoxFit.cover,
                ),
              )
            ]),
      ),
    );
  }
}

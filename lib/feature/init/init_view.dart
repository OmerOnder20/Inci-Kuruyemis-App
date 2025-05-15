import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inci_kuruyemis/product/controller/cart_controller.dart';
import 'package:inci_kuruyemis/product/controller/user_controller.dart';
import 'package:inci_kuruyemis/product/navigator/app_router.dart';
import 'package:inci_kuruyemis/product/service/auth_service.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/core/size/sizes.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

import '../../product/utility/constants/asset_constants.dart';
import '../../product/utility/sizes/widget_size.dart';

@RoutePage()
class InitView extends StatefulWidget {
  const InitView({super.key});

  @override
  State<InitView> createState() => _InitViewState();
}

class _InitViewState extends State<InitView> {
  late final AuthService _authService;
  bool isAuth = false;

  void changeAuth() {
    setState(() {
      isAuth = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
    checkCookie();
  }

  Future<void> checkCookie() async {
    final response = await _authService.loginCookie();
    if (response?.data?.username != null) {
      print("Cookie Başarılı!");
      print(response?.data?.username);
      print(response?.data?.id);
      print(response?.data?.name);
      print(response?.data?.surname);
      print(response?.data?.email);
      Provider.of<UserController>(context, listen: false).setUserDatas(
          response?.data?.name ?? "",
          response?.data?.email ?? "",
          response?.data?.username ?? "");
      changeAuth();
    } else {
      print("Cookie Başarısız!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: const NeverScrollableScrollPhysics(),
      animatePageTransition: false,
      routes: [
        const AnaSayfaRoute(),
        const AramaRoute(),
        const SepetRoute(),
        const KampanyaRoute(),
        isAuth ? const ProfilInfoRoute() : const ProfilRoute()
      ],
      builder: (context, child, tabController) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: child,
          bottomNavigationBar: SizedBox(
            height: Platform.isAndroid
                ? WidgetSizes.bottomNavigationBarAndroidHeight
                : WidgetSizes.bottomNavigationBarIosHeight,
            child: BottomNavigationBar(
                backgroundColor: ColorUtility.whiteColor,
                elevation: 20,
                unselectedItemColor: const Color(0xffA5B1C0),
                selectedItemColor: Colors.black,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedFontSize: 9,
                unselectedFontSize: 9,
                unselectedLabelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                ),
                selectedLabelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                ),
                type: BottomNavigationBarType.fixed,
                currentIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
                items: [
                  BottomNavigationBarItem(
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: SvgPicture.asset(
                          AssetConstants.homeSvg,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                              ColorUtility.blackColor, BlendMode.srcIn),
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: SvgPicture.asset(
                          AssetConstants.homeSvg,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                              ColorUtility.tabItemsGrey, BlendMode.srcIn),
                        ),
                      ),
                      label: StringConstants.anaSayfa),
                  BottomNavigationBarItem(
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: SvgPicture.asset(
                          AssetConstants.searchSvg,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                              ColorUtility.blackColor, BlendMode.srcIn),
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: SvgPicture.asset(
                          AssetConstants.searchSvg,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                              ColorUtility.tabItemsGrey, BlendMode.srcIn),
                        ),
                      ),
                      label: StringConstants.ara),
                  BottomNavigationBarItem(
                      activeIcon:
                          Stack(alignment: Alignment.topRight, children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Image.asset(
                            AssetConstants.basketPng,
                            height: SizeUtility.mediumX,
                            width: SizeUtility.mediumX,
                            fit: BoxFit.cover,
                            color: ColorUtility.blackColor,
                          ),
                        ),
                        context.watch<CartController>().sepetItems.isNotEmpty
                            ? Container(
                                height: SizeUtility.smallXXX.h,
                                width: SizeUtility.smallXXX.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorUtility.redColor,
                                ),
                                child: Center(
                                    child: Text(
                                  context
                                      .watch<CartController>()
                                      .sepetUrunSayisi
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 8.sp,
                                      letterSpacing: 0,
                                      color: ColorUtility.textColorBlack,
                                      fontWeight: FontWeight.w600,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall),
                                )),
                              )
                            : const SizedBox.shrink(),
                      ]),
                      icon: Stack(alignment: Alignment.topRight, children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Image.asset(
                            AssetConstants.basketPng,
                            height: SizeUtility.mediumX,
                            width: SizeUtility.mediumX,
                            fit: BoxFit.cover,
                            color: ColorUtility.tabItemsGrey,
                          ),
                        ),
                        context.watch<CartController>().sepetItems.isNotEmpty
                            ? Container(
                                height: SizeUtility.smallXXX.h,
                                width: SizeUtility.smallXXX.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorUtility.redColor,
                                ),
                                child: Center(
                                    child: Text(
                                  context
                                      .watch<CartController>()
                                      .sepetUrunSayisi
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 8.sp,
                                      letterSpacing: 0,
                                      color: ColorUtility.textColorBlack,
                                      fontWeight: FontWeight.w600,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall),
                                )),
                              )
                            : const SizedBox.shrink(),
                      ]),
                      label: StringConstants.sepetim),
                  BottomNavigationBarItem(
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Image.asset(
                          AssetConstants.campaignPng,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.contain,
                          color: ColorUtility.blackColor,
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Image.asset(
                          AssetConstants.campaignPng,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.contain,
                          color: ColorUtility.tabItemsGrey,
                        ),
                      ),
                      label: StringConstants.kampanya),
                  BottomNavigationBarItem(
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: SvgPicture.asset(
                          AssetConstants.profileSvg,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                              ColorUtility.blackColor, BlendMode.srcIn),
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: SvgPicture.asset(
                          AssetConstants.profileSvg,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                              ColorUtility.tabItemsGrey, BlendMode.srcIn),
                        ),
                      ),
                      label: StringConstants.profil)
                ]),
          ),
        );
      },
    );
  }
}

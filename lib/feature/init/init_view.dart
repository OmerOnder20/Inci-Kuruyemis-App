import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inci_kuruyemis/product/navigator/app_router.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/product/utility/sizes/sizes.dart';

import '../../product/utility/constants/asset_constants.dart';
import '../../product/utility/sizes/widget_size.dart';

@RoutePage()
class InitView extends StatefulWidget {
  const InitView({super.key});

  @override
  State<InitView> createState() => _InitViewState();
}

class _InitViewState extends State<InitView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: const NeverScrollableScrollPhysics(),
      animatePageTransition: false,
      routes: const [AnaSayfaRoute(), AramaRoute(), SepetRoute(), KampanyaRoute(), ProfilRoute()],
      builder: (context, child, tabController) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          backgroundColor: Colors.amber,
          body: child,
          bottomNavigationBar: SizedBox(
            height: WidgetSizes.bottomNavigationBarHeight,
            child: BottomNavigationBar(
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
                          color: Colors.black,
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: SvgPicture.asset(
                          AssetConstants.homeSvg,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.cover,
                          color: const Color(0xffC2CCD8),
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
                          color: Colors.black,
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: SvgPicture.asset(
                          AssetConstants.searchSvg,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.cover,
                          color: const Color(0xffC2CCD8),
                        ),
                      ),
                      label: StringConstants.ara),
                  BottomNavigationBarItem(
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Image.asset(
                          AssetConstants.basketPng,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.cover,
                          color: Colors.black,
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Image.asset(
                          AssetConstants.basketPng,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.cover,
                          color: const Color(0xffC2CCD8),
                        ),
                      ),
                      label: StringConstants.sepetim),
                  BottomNavigationBarItem(
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Image.asset(
                          AssetConstants.campaignPng,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.contain,
                          color: Colors.black,
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Image.asset(
                          AssetConstants.campaignPng,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.contain,
                          color: const Color(0xffC2CCD8),
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
                          color: Colors.black,
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: SvgPicture.asset(
                          AssetConstants.profileSvg,
                          height: SizeUtility.mediumX,
                          width: SizeUtility.mediumX,
                          fit: BoxFit.cover,
                          color: const Color(0xffC2CCD8),
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

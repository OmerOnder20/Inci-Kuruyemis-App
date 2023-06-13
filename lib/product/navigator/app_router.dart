import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../feature/anaSayfa/ana_sayfa_view.dart';
import '../../feature/arama/arama_view.dart';
import '../../feature/init/init_view.dart';
import '../../feature/kampanya/kampanya_view.dart';
import '../../feature/kampanyaDetay/kampanya_detay_view.dart';
import '../../feature/kargoTeslimat/kargo_teslimat_view.dart';
import '../../feature/kategori/kategori_view.dart';
import '../../feature/profil/profil_view.dart';
import '../../feature/profilDetay/profil_detay_view.dart';
import '../../feature/sepet/sepet_view.dart';
import '../../feature/splash/splash_view.dart';
import '../../feature/ödemeSeçenekleri/ödeme_seçenekleri_view.dart';
import '../../feature/ürünDetay/ürün_detay_view.dart';
import '../../feature/ürünÖzellikler/ürün_özellikler_view.dart';
import '../utility/constants/app_routes.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "View,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: SplashRoute.page, path: AppRoutes.routeSplash),
        AutoRoute(page: InitRoute.page, path: AppRoutes.routeInit, children: [
          AutoRoute(page: EmptyRoute.page, path: AppRoutes.routeEmpty1, initial: true, maintainState: true, children: [
            AutoRoute(page: AnaSayfaRoute.page, path: AppRoutes.routeHome, initial: true),
            AutoRoute(page: KategoriRoute.page, path: AppRoutes.routeCategory),
            AutoRoute(page: UrunDetayRoute.page, path: AppRoutes.routeDetail),
            AutoRoute(page: UrunOzelliklerRoute.page, path: AppRoutes.routeFeatures),
            AutoRoute(page: KargoTeslimatRoute.page, path: AppRoutes.routeDelivery),
            AutoRoute(page: OdemeSecenekleriRoute.page, path: AppRoutes.routePayment),
          ]),
          AutoRoute(page: EmptyKampanyaRoute.page, path: AppRoutes.routeEmpty2, children: [
            AutoRoute(page: KampanyaRoute.page, path: AppRoutes.routeCampaign, initial: true),
            AutoRoute(page: KampanyaDetayRoute.page, path: AppRoutes.routeCampaignDetail),
          ]),
          AutoRoute(page: SepetRoute.page, path: AppRoutes.routeBasket),
          AutoRoute(page: AramaRoute.page, path: AppRoutes.routeSearch),
          AutoRoute(page: EmptyProfilRoute.page, path: AppRoutes.routeEmpty3, children: [
            AutoRoute(page: ProfilRoute.page, path: AppRoutes.routeProfile, initial: true),
            AutoRoute(page: ProfilDetayRoute.page, path: AppRoutes.routeProfileDetail)
          ])
        ]),
      ];
}

@RoutePage()
class EmptyView extends AutoRouter {}

@RoutePage()
class EmptyKampanyaView extends AutoRouter {}

@RoutePage()
class EmptyProfilView extends AutoRouter {}

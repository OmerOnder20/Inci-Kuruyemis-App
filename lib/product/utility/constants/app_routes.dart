import 'package:flutter/material.dart';

@immutable
class AppRoutes {
  const AppRoutes._();

  static const String routeSplash = "/splash";
  static const String routeInit = "/init";
  static const String routeHome = "home";
  static const String routeSearch = "search";
  static const String routeBasket = "basket";
  static const String routeCampaign = "campaign";
  static const String routeProfile = "profile";
  static const String routeCategory = "category";
  static const String routeDetail = "detay";
  static const String routeFeatures = "özellikler";
  static const String routeDelivery = "teslimat";
  static const String routePayment = "ödeme";
  static const String routeCampaignDetail = "kampanyaDetay";
  static const String routeProfileDetail = "profilDetay";
  static const String routeProfileInfo = "profilInfo";
  static const String routePurchase = "purchase";
  static const String routeEmpty1 = "empty1";
  static const String routeEmpty2 = "empty2";
  static const String routeEmpty3 = "empty3";
  static const String routeEmpty4 = "empty3";

//Ana rootlarda slash yani iç çizgi kullanılır ama çocuklarında kullanılmaz.
//İç rootlarda slash kullanılması taktirde hata verir.
// Ürün detay sayfası için tekrardan videoyu izle. Yani çocuk sayfası için.
}

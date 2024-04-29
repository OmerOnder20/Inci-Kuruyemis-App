import 'package:flutter/material.dart';

@immutable
class ApiConstants {
  const ApiConstants._();
  static const String baseUrl = "https://inci.lambatech.com/api/v1";
  static const String categories = "categories";
  static const String products = "products";
  static const String documents = "documents";
  static const String paymentDescription = "payment-description";
  static const String shippingDescription = "shipping-description";
  static const String userAggreement = "user-aggreement";
  static const String illuminationText = "illumination-text";
  static const String user = "user";
  static const String session = "session";
  static const String campaigns = "campaigns";
  static const String searchQuery = "search?query=";
}

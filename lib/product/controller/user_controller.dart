import 'package:flutter/material.dart';

import '../models/ürün_model.dart';

class UserController extends ChangeNotifier {
  Map<Products, int> sepetUrunleri = {};

  List<Products> get sepetItems => sepetUrunleri.keys.toList();

  List<Variations>? variations = [];

  int selectedVariation = 0;

  void removeAllSepet() {
    sepetUrunleri.clear();
    notifyListeners();
  }

  void removeUrun(Products products) {
    sepetUrunleri.remove(products);
    notifyListeners();
  }

  void selectVariation1() {
    selectedVariation = 0;
    notifyListeners();
  }

  void selectVariation2() {
    selectedVariation = 1;
    notifyListeners();
  }

  void selectVariation3() {
    selectedVariation = 2;
    notifyListeners();
  }

  void selectVariation4() {
    selectedVariation = 3;
    notifyListeners();
  }

  double get sepetFiyati {
    if (sepetUrunleri.isEmpty) {
      return 0;
    } else {
      double _toplam = 0;
      sepetUrunleri.forEach((key, value) {
        var selectedPrice = key.variations?[selectedVariation].price;
        if (selectedPrice != null) {
          _toplam += (double.tryParse(selectedPrice) ?? 0) * value;
        }
      });
      return _toplam;
    }
  }

  void sepeteUrunuEkle(Products products) {
    sepetUrunleri[products] = 1;
    notifyListeners();
  }

  void urunAdetArtma(Products products) {
    if (sepetUrunleri[products] != null) {
      if (sepetUrunleri.containsKey(products)) {
        sepetUrunleri[products] = sepetUrunleri[products]! + 1;
      } else {
        sepetUrunleri[products] = 1;
      }
    }
    notifyListeners();
  }

  void urunAdetAzaltma(Products products) {
    if (sepetUrunleri[products] != null) {
      if (sepetUrunleri[products]! > 1) {
        sepetUrunleri[products] = sepetUrunleri[products]! - 1;
      } else {
        sepetUrunleri.remove(products);
      }
    }
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import '../models/ürün_model.dart';

class CartController extends ChangeNotifier {
  Map<Products, int> sepetUrunleri = {};

  List<Products> get sepetItems => sepetUrunleri.keys.toList();

  void removeAllSepet() {
    sepetUrunleri.clear();
    notifyListeners();
  }

  void removeUrun(Products products) {
    sepetUrunleri.remove(products);
    notifyListeners();
  }

  void selectVariation(Products products, int index) {
    products.variationIndex = index;
    products.isShown = true;
    notifyListeners();
  }

  double get sepetFiyati {
    if (sepetUrunleri.isEmpty) {
      return 0;
    } else {
      double _toplam = 0;
      sepetUrunleri.forEach((key, value) {
        var selectedPrice = key.variations?[key.variationIndex].price;
        if (selectedPrice != null) {
          _toplam += (double.tryParse(selectedPrice) ?? 0) * value;
        }
      });
      return _toplam;
    }
  }

  int get sepetUrunSayisi {
    int toplamUrunSayisi = 0;
    sepetUrunleri.values.forEach((element) {
      toplamUrunSayisi += element;
    });
    return toplamUrunSayisi;
  }

  void sepeteUrunuEkle(Products products) {
    if (!sepetUrunleri.containsKey(products)) {
      sepetUrunleri[products] = 1;
    } else {
      sepetUrunleri[products] = sepetUrunleri[products]! + 1;
    }
    notifyListeners();
  }

  void urunAdetArtma(Products products) {
    if (sepetUrunleri[products] != null) {
      sepetUrunleri[products] = sepetUrunleri[products]! + 1;
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

import 'package:flutter/material.dart';
import 'package:inci_kuruyemis/product/models/kategori_model.dart';
import 'package:inci_kuruyemis/product/service/kategori_service.dart';

class AnaSayfaProvider extends ChangeNotifier {
  final IKategoriService _kategoriService;
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  List<KategoriModel>? kategoriItems = [];

  AnaSayfaProvider(this._kategoriService) {
    _fetchKategoriItems();
  }

  Future<void> _fetchKategoriItems() async {
    _changeLoading();
    kategoriItems = await _kategoriService.fetchKategori() ?? [];
    _changeLoading();
  }
}

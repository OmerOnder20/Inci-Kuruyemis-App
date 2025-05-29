import 'package:flutter/material.dart';
import 'package:inci_kuruyemis/product/models/kategori_model.dart';
import 'package:inci_kuruyemis/product/models/slide_model.dart';
import 'package:inci_kuruyemis/product/service/kategori_service.dart';

class AnaSayfaProvider extends ChangeNotifier {
  final IKategoriService _kategoriService;
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  List<Data>? kategoriItems = [];
  List<SlideData>? slideItems = [];

  AnaSayfaProvider(this._kategoriService) {
    fetchKategoriItems();
  }

  Future<void> fetchKategoriItems() async {
    _changeLoading();
    kategoriItems = (await _kategoriService.fetchKategori())?.data ?? [];
    slideItems = (await _kategoriService.fetchSlide())?.data ?? [];
    slideItems?.sort((a, b) => (a.sortOrder ?? 0).compareTo(b.sortOrder ?? 0));

    _changeLoading();
  }
}

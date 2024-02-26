import 'package:flutter/material.dart';
import 'package:inci_kuruyemis/product/service/d%C3%B6k%C3%BCman_service.dart';

class KargoProvider extends ChangeNotifier {
  final IDokumanService _dokumanService;
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  String? teslimatItem = "";

  KargoProvider(this._dokumanService) {
    _fetchTeslimatItem();
  }

  Future<void> _fetchTeslimatItem() async {
    _changeLoading();
    teslimatItem = (await _dokumanService.fetchTeslimatDatas())?.data;
    _changeLoading();
  }
}

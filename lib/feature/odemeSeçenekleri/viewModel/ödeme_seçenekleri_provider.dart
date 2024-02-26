import 'package:flutter/material.dart';
import 'package:inci_kuruyemis/product/service/d%C3%B6k%C3%BCman_service.dart';

class OdemeProvider extends ChangeNotifier {
  final IDokumanService _dokumanService;
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  String? odemeItem = "";

  OdemeProvider(this._dokumanService) {
    _fetchOdemeItem();
  }

  Future<void> _fetchOdemeItem() async {
    _changeLoading();
    odemeItem = (await _dokumanService.fetchOdemeDatas())?.data;
    _changeLoading();
  }
}

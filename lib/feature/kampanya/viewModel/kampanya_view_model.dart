import 'package:flutter/material.dart';
import 'package:inci_kuruyemis/product/models/kampanya_model.dart';

import '../../../product/service/kampanya_service.dart';

class KampanyaProvider extends ChangeNotifier {
  final IKampanyaService _kampanyaService;
  bool isLoading = false;
  List<Data?> kampanyaItems = [];

  KampanyaProvider(this._kampanyaService) {
    _fetchKampanyaDatas();
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _fetchKampanyaDatas() async {
    _changeLoading();
    kampanyaItems = (await _kampanyaService.fetchKampanyaDatas())?.data ?? [];
    _changeLoading();
  }
}

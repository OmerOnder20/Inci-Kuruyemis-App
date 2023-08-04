import 'package:flutter/material.dart';

import '../../../product/models/ürün_model.dart';
import '../../../product/service/ürün_service.dart';
import '../view/kategori_view.dart';

abstract class KategoriViewModel extends State<KategoriView> {
  late final IUrunService urunService;
  bool isLoading = false;
  List<Products>? urunItems;

  @override
  void initState() {
    super.initState();
    urunService = UrunService();
    fetchItemsWithId(widget.categoryId);
  }

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> fetchItemsWithId(int id) async {
    _changeLoading();
    urunItems = (await urunService.fetchKategoriWithId(id))?.products;
    _changeLoading();
  }
}

import 'package:dio/dio.dart';
import 'package:inci_kuruyemis/product/models/kategori_model.dart';
import 'dart:io';

import '../utility/constants/api_constants.dart';

abstract class IKategoriService {
  Future<List<KategoriModel>?> fetchKategori();
}

class KategoriService extends IKategoriService {
  final Dio _dio;
  KategoriService() : _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  Future<List<KategoriModel>?> fetchKategori() async {
    try {
      final response = await _dio.get("/${ApiConstants.categories}");
      if (response.statusCode == HttpStatus.ok) {
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => KategoriModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

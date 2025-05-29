import 'package:dio/dio.dart';
import 'package:inci_kuruyemis/core/network/network_manager.dart';
import 'package:inci_kuruyemis/product/models/kategori_model.dart';
import 'package:inci_kuruyemis/product/models/slide_model.dart';
import 'dart:io';

import '../utility/constants/api_constants.dart';

abstract class IKategoriService {
  Future<KategoriModel?> fetchKategori();
  Future<SlideModel?> fetchSlide();
}

class KategoriService extends IKategoriService {
  final Dio _dio;
  KategoriService() : _dio = NetworkManger.instance.dio;

  Future<KategoriModel?> fetchKategori() async {
    try {
      final response = await _dio.get("/${ApiConstants.categories}");
      if (response.statusCode == HttpStatus.ok) {
        final responseBody = response.data;
        if (responseBody is Map<String, dynamic>) {
          return KategoriModel.fromJson(responseBody);
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<SlideModel?> fetchSlide() async {
    try {
      final response = await _dio.get("/${ApiConstants.slides}");
      if (response.statusCode == HttpStatus.ok) {
        final responseBody = response.data;
        if (responseBody is Map<String, dynamic>) {
          return SlideModel.fromJson(responseBody);
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

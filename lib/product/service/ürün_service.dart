import 'package:dio/dio.dart';
import 'package:inci_kuruyemis/core/network/network_manager.dart';
import 'package:inci_kuruyemis/product/models/%C3%BCr%C3%BCn_model.dart';
import 'dart:io';

import '../utility/constants/api_constants.dart';

abstract class IUrunService {
  Future<UrunModel?> fetchKategoriWithId(int categoryId);
}

class UrunService extends IUrunService {
  final Dio _dio;
  UrunService() : _dio = NetworkManger.instance.dio;

  Future<UrunModel?> fetchKategoriWithId(int categoryId) async {
    try {
      final response = await _dio.get(
          "/${ApiConstants.categories}/$categoryId/${ApiConstants.products}",
          queryParameters: {"id": categoryId});
      if (response.statusCode == HttpStatus.ok) {
        final responseBody = response.data;
        if (responseBody is Map<String, dynamic>) {
          return UrunModel.fromJson(responseBody);
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

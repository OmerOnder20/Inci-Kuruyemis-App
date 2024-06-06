import 'dart:io';
import 'package:dio/dio.dart';
import 'package:inci_kuruyemis/core/network/network_manager.dart';
import 'package:inci_kuruyemis/product/models/kampanya_model.dart';
import 'package:inci_kuruyemis/product/utility/constants/api_constants.dart';

abstract class IKampanyaService {
  Future<KampanyaModel?> fetchKampanyaDatas();
}

class KampanyaService extends IKampanyaService {
  final Dio _dio;
  KampanyaService() : _dio = NetworkManger.instance.dio;

  @override
  Future<KampanyaModel?> fetchKampanyaDatas() async {
    try {
      final response = await _dio.get("/${ApiConstants.campaigns}");
      if (response.statusCode == HttpStatus.ok) {
        final responseBody = response.data;
        if (responseBody is Map<String, dynamic>) {
          return KampanyaModel.fromJson(responseBody);
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

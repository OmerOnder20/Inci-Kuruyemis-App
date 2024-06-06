import 'dart:io';

import 'package:dio/dio.dart';
import 'package:inci_kuruyemis/core/network/network_manager.dart';
import 'package:inci_kuruyemis/product/models/d%C3%B6k%C3%BCman_model.dart';
import 'package:inci_kuruyemis/product/utility/constants/api_constants.dart';

abstract class IDokumanService {
  Future<DokumanModel?> fetchOdemeDatas();
  Future<DokumanModel?> fetchTeslimatDatas();
  Future<DokumanModel?> fetchSozlesmeDatas();
  Future<DokumanModel?> fetchAciklamaDatas();
}

class DokumanService extends IDokumanService {
  final Dio _dio;
  DokumanService() : _dio = NetworkManger.instance.dio;

  Future<DokumanModel?> fetchOdemeDatas() async {
    try {
      final response = await _dio
          .get("/${ApiConstants.documents}/${ApiConstants.paymentDescription}");
      if (response.statusCode == HttpStatus.ok) {
        final responseBody = response.data;
        if (responseBody is Map<String, dynamic>) {}
        return DokumanModel.fromJson(responseBody);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<DokumanModel?> fetchTeslimatDatas() async {
    try {
      final response = await _dio.get(
          "/${ApiConstants.documents}/${ApiConstants.shippingDescription}");
      if (response.statusCode == HttpStatus.ok) {
        final responseBody = response.data;
        if (responseBody is Map<String, dynamic>) {}
        return DokumanModel.fromJson(responseBody);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<DokumanModel?> fetchSozlesmeDatas() async {
    try {
      final response = await _dio
          .get("/${ApiConstants.documents}/${ApiConstants.userAggreement}");
      if (response.statusCode == HttpStatus.ok) {
        final responseBody = response.data;
        if (responseBody is Map<String, dynamic>) {}
        return DokumanModel.fromJson(responseBody);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<DokumanModel?> fetchAciklamaDatas() async {
    try {
      final response = await _dio
          .get("/${ApiConstants.documents}/${ApiConstants.illuminationText}");
      if (response.statusCode == HttpStatus.ok) {
        final responseBody = response.data;
        if (responseBody is Map<String, dynamic>) {}
        return DokumanModel.fromJson(responseBody);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

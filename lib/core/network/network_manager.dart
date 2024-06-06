import 'package:dio/dio.dart';
import 'package:inci_kuruyemis/product/utility/constants/api_constants.dart';

class NetworkManger {
  NetworkManger._() {
    _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  }

  late final Dio _dio;

  static NetworkManger instance = NetworkManger._();

  Dio get dio => _dio;
}

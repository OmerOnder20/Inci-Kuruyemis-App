import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:inci_kuruyemis/product/utility/constants/api_constants.dart';
import 'package:path_provider/path_provider.dart';

class NetworkManger {
  NetworkManger._() {
    _dio = Dio(
      BaseOptions(baseUrl: ApiConstants.baseUrl),
    );
    cookieFuture = getCookie();
  }

  late final Future cookieFuture;
  late final Dio _dio;

  static NetworkManger instance = NetworkManger._();

  Dio get dio => _dio;

  Future<void> getCookie() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    var cookieJar = PersistCookieJar(
      storage: FileStorage(appDocPath + "/.cookies/"),
    );
    dio.interceptors.add(CookieManager(cookieJar));
  }
}

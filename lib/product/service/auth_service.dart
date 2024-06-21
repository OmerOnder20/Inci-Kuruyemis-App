import 'package:dio/dio.dart';
import 'package:inci_kuruyemis/core/network/network_manager.dart';
import 'package:inci_kuruyemis/product/models/login_response_model.dart';
import 'package:inci_kuruyemis/product/utility/constants/api_constants.dart';

abstract class IAuthService {
  Future<LoginResponseModel?> loginPost(String username, String password);
  Future<LoginResponseModel?> loginCookie();
}

class AuthService extends IAuthService {
  late final Dio dio;

  AuthService() : dio = NetworkManger.instance.dio;

  Future<LoginResponseModel?> loginPost(
      String username, String password) async {
    try {
      Response response = await dio.post(
        "/${ApiConstants.user}/${ApiConstants.session}",
        data: {'username': username, 'password': password},
      );
      if (response.statusCode == 200) {
        print(response.statusCode);
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to login');
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }

  @override
  Future<LoginResponseModel?> loginCookie() async {
    try {
      final response = await dio.get(
        "/${ApiConstants.user}/${ApiConstants.session}",
      );
      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (error) {
      print(error);
    }
    return null;
  }
}

import 'package:dio/dio.dart';
import 'package:inci_kuruyemis/product/models/login_response_model.dart';
import 'package:inci_kuruyemis/product/utility/constants/api_constants.dart';

abstract class IAuthService {
  Future<LoginResponseModel?> loginPost(String username, String password);
}

class AuthService extends IAuthService {
  late final Dio dio;

  AuthService() : dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

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
}

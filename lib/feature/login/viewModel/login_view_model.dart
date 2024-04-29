import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/login/view/login_view.dart';
import 'package:inci_kuruyemis/feature/profilInfo/view/profile_info_view.dart';
import 'package:inci_kuruyemis/product/controller/user_controller.dart';
import 'package:inci_kuruyemis/product/service/auth_service.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:inci_kuruyemis/product/utility/constants/api_constants.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_medium_1.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_small_1.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

abstract class LoginViewModel extends State<HaveAccView> {
  late final AuthService _authService;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
  }

  void loginSendDatas(String username, String password) async {
    try {
      final response = await _authService.loginPost(username, password);
      if (response?.status == 200) {
        Directory appDocDir = await getApplicationDocumentsDirectory();
        String appDocPath = appDocDir.path;
        var cookieJar = PersistCookieJar(
          storage: FileStorage(appDocPath + "/.cookies/"),
        );
        _authService.dio.interceptors.add(CookieManager(cookieJar));
        List<Cookie> cookies = await (_authService.dio.interceptors
                    .firstWhere((element) => element is CookieManager)
                as CookieManager)
            .cookieJar
            .loadForRequest(Uri.parse(ApiConstants.baseUrl));
        print("Received Cookies:");
        for (var cookie in cookies) {
          print("${cookie.name}: ${cookie.value}");
        }
        print("Giriş Başarılı!");
        print("Kullanıcı Adı: ${response?.data?.name}");
        print("Kullanıcı Adı: ${response?.data?.username}");
        print("Email: ${response?.data?.email}");
        Provider.of<UserController>(context, listen: false).setUserDatas(
            response?.data?.name ?? "",
            response?.data?.email ?? "",
            response?.data?.username ?? "");
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ProfilInfoView()));
      }
    } catch (e) {
      print("Hata oluştu: $e");
      showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 55.w, vertical: 30.h),
          title: Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: const Center(
                child: TitleMedium1(
              text: StringConstants.yanlisGirdiniz,
            )),
          ),
          backgroundColor: ColorUtility.scaffoldBackGroundColor,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.amber,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const TitleSmall1(text: StringConstants.tekrarDene),
            ),
          ],
        ),
      );
    }
  }
}

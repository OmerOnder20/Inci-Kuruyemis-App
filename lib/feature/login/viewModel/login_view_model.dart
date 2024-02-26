import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/login/view/login_view.dart';
import 'package:inci_kuruyemis/feature/profilInfo/view/profile_info_view.dart';
import 'package:inci_kuruyemis/product/controller/user_controller.dart';
import 'package:inci_kuruyemis/product/service/auth_service.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_medium_1.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_small_1.dart';
import 'package:provider/provider.dart';

abstract class LoginViewModel extends State<HaveAccView> {
  late final IAuthService _authService;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
  }

  void loginSendDatas(String username, String password) async {
    try {
      final response = await _authService.loginPost(username, password);
      if (response?.status == 200) {
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
      // DioException'u ele al
      print("Hata oluştu: $e");
      // DioException'dan kaynaklanan 400 hatası olduğunda ana sayfaya git
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

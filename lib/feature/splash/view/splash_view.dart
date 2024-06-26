import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inci_kuruyemis/product/service/auth_service.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:inci_kuruyemis/product/utility/constants/asset_constants.dart';
import '../../../product/navigator/app_router.dart';
import '../../../product/utility/sizes/widget_size.dart';
import '../widgets/splash_app_bar.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final AuthService _authService;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
    deneme();
    nagigateToInit();
  }

  Future<void> nagigateToInit() async {
    await Future.delayed(const Duration(seconds: 2));
    context.router.replace(const InitRoute());
    FlutterNativeSplash.remove();
  }

  Future<void> deneme() async {
    final response = await _authService.loginCookie();
    print(response?.data?.email);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SplashAppBar(),
      backgroundColor: ColorUtility.yellowColor,
      body: _SplashLogo(),
    );
  }
}

class _SplashLogo extends StatelessWidget {
  const _SplashLogo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        AssetConstants.logoCircleWithStrokeSvg,
        height: WidgetSizes.splashLogoHeightAndWidth,
        width: WidgetSizes.splashLogoHeightAndWidth,
        fit: BoxFit.cover,
      ),
    );
  }
}

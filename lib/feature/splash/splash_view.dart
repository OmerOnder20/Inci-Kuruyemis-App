import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:inci_kuruyemis/product/utility/constants/asset_constants.dart';

import '../../product/navigator/app_router.dart';
import '../../product/utility/sizes/widget_size.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    nagigateToInit();
    FlutterNativeSplash.remove();
  }

  void nagigateToInit() async {
    await Future.delayed(const Duration(seconds: 2));
    context.router.replace(const InitRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SplashAppBar(),
      backgroundColor: ColorUtility.yellowColor,
      body: SplashLogo(),
    );
  }
}

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
  });

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

class SplashAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SplashAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: ColorUtility.yellowColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}

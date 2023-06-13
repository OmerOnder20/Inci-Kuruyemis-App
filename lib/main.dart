import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/navigator/app_router.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/product/utility/theme/app_bar_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 300));
  FlutterNativeSplash.remove();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => MaterialApp.router(
        theme: ThemeData(
            scaffoldBackgroundColor: ColorUtility.scaffoldBackGroundColor,
            appBarTheme: InciAppBarTheme().inciAppBarTheme,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Colors.transparent,
            )),
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
        title: StringConstants.appName,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInit {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}

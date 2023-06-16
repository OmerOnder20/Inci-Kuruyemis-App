import 'package:flutter/material.dart';

class GlobalController extends ChangeNotifier {
  bool isCompleted = false;

  void changeCompleted() {
    isCompleted = !isCompleted;
    notifyListeners();
  }
}

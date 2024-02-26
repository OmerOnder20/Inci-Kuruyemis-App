import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  String? name;
  String? email;
  String? username;

  void setUserDatas(String newName, String newEmail, String newUsername) {
    name = newName;
    email = newEmail;
    username = newUsername;
    notifyListeners();
  }
}

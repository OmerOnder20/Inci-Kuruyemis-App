// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

@immutable
class LoginResponseModel {
  int? status;
  String? message;
  Data? data;

  LoginResponseModel({this.status, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

@immutable
class Data {
  int? id;
  String? name;
  String? email;
  bool? isActivated;
  String? username;
  String? surname;

  Data(
      {this.id,
      this.name,
      this.email,
      this.isActivated,
      this.username,
      this.surname});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    isActivated = json['is_activated'];
    username = json['username'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['is_activated'] = this.isActivated;
    data['username'] = this.username;
    data['surname'] = this.surname;
    return data;
  }
}

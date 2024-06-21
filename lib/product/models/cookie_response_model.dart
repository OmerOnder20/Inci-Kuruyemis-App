// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

@immutable
class CookieResponseModel {
  int? status;
  String? message;
  Data? data;

  CookieResponseModel({this.status, this.message, this.data});

  CookieResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? username;
  String? surname;

  Data({this.id, this.name, this.email, this.username, this.surname});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['surname'] = this.surname;
    return data;
  }
}

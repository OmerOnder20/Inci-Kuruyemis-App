// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

@immutable
class DokumanModel {
  String? data;

  DokumanModel({this.data});

  DokumanModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    return data;
  }
}

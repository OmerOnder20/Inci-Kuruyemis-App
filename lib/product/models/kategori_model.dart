// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

@immutable
class KategoriModel {
  List<Data>? data;

  KategoriModel({this.data});

  KategoriModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

@immutable
class Data {
  int? id;
  String? name;
  int? sortOrder;
  Image? image;

  Data({this.id, this.name, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sortOrder = json['sort_order'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }
}

@immutable
class Image {
  String? path;

  Image({this.path});

  Image.fromJson(Map<String, dynamic> json) {
    path = json['path'];
  }
}

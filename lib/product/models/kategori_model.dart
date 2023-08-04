import 'package:flutter/material.dart';

@immutable
class KategoriModel {
  int? id;
  String? name;
  Image? image;

  KategoriModel({this.id, this.name, this.image});

  KategoriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
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

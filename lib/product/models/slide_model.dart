// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

@immutable
class SlideModel {
  List<SlideData>? data;

  SlideModel({this.data});

  SlideModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SlideData>[];
      json['data'].forEach((v) {
        data!.add(new SlideData.fromJson(v));
      });
    }
  }
}

class SlideData {
  int? id;
  String? name;
  SlideImage? image;

  SlideData({this.id, this.name, this.image});

  SlideData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'] != null ? SlideImage.fromJson(json['image']) : null;
  }
}

@immutable
class SlideImage {
  String? path;

  SlideImage({this.path});

  SlideImage.fromJson(Map<String, dynamic> json) {
    path = json['path'];
  }
}

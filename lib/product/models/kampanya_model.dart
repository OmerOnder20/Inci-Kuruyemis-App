// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

@immutable
class KampanyaModel {
  int? status;
  String? message;
  List<Data>? data;

  KampanyaModel({this.status, this.message, this.data});

  KampanyaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@immutable
class Data {
  int? id;
  String? name;
  String? summary;
  String? description;
  int? isActive;
  Image? image;

  Data(
      {this.id,
      this.name,
      this.summary,
      this.description,
      this.isActive,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    summary = json['summary'];
    description = json['description'];
    isActive = json['is_active'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['summary'] = this.summary;
    data['description'] = this.description;
    data['is_active'] = this.isActive;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

@immutable
class Image {
  String? path;

  Image({this.path});

  Image.fromJson(Map<String, dynamic> json) {
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    return data;
  }
}

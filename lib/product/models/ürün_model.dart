import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class UrunModel {
  String? name;
  List<Products>? products;

  UrunModel({this.name, this.products});

  UrunModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@immutable
class Products extends Equatable {
  int? id;
  String? name;
  String? description;
  int? categoryId;
  List<Images>? images;
  List<Variations>? variations;

  Products(
      {this.id,
      this.name,
      this.description,
      this.categoryId,
      this.images,
      this.variations});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    categoryId = json['category_id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['category_id'] = this.categoryId;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [id];
}

@immutable
class Images {
  String? path;

  Images({this.path});

  Images.fromJson(Map<String, dynamic> json) {
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    return data;
  }
}

@immutable
class Variations {
  int? id;
  String? name;
  String? price;
  String? compareAtPrice;
  int? productId;

  Variations(
      {this.id, this.name, this.price, this.compareAtPrice, this.productId});

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    compareAtPrice = json['compare_at_price'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['compare_at_price'] = this.compareAtPrice;
    data['product_id'] = this.productId;
    return data;
  }
}

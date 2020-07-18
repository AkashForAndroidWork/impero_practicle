import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable(nullable: true)
class ProductModel{
  @JsonKey(name: 'Id', includeIfNull: false)
  int productId;
  @JsonKey(name: 'Name', includeIfNull: false)
  String productName;
  @JsonKey(name: 'PriceCode', includeIfNull: false)
  String productPriceCode;
  @JsonKey(name: 'ImageName', includeIfNull: false)
  String productImageUrl;

  ProductModel({@required this.productId, @required this.productName, @required this.productPriceCode,
    @required this.productImageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

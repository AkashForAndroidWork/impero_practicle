import 'package:flutter/material.dart';
import 'package:impero_practicle/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'subcategory_model.g.dart';

@JsonSerializable(nullable: true)
class SubcategoryModel{
  @JsonKey(name: 'Id', includeIfNull: false)
  int subCategoryId;
  @JsonKey(name: 'Name', includeIfNull: false)
  String subCategoryName;
  @JsonKey(name: 'Product', includeIfNull: false)
  List<ProductModel> productModelList;

  SubcategoryModel(
      {@required this.subCategoryId, @required this.subCategoryName, this.productModelList});

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) => _$SubcategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubcategoryModelToJson(this);
}
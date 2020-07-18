import 'package:flutter/material.dart';
import 'package:impero_practicle/models/subcategory_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable(nullable: true)
class CategoryModel {
  @JsonKey(name: 'Id', includeIfNull: false)
  int categoryId;
  @JsonKey(name: 'Name', includeIfNull: false)
  String categoryName;
  @JsonKey(name: 'SubCategories', includeIfNull: false)
  List<SubcategoryModel> subcategoryModelList;

  CategoryModel(
      {@required this.categoryId,
      @required this.categoryName,
      this.subcategoryModelList});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

}

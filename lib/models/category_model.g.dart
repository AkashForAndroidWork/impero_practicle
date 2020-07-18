// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return CategoryModel(
    categoryId: json['Id'] as int,
    categoryName: json['Name'] as String,
    subcategoryModelList: (json['SubCategories'] as List)
        ?.map((e) => e == null
            ? null
            : SubcategoryModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.categoryId);
  writeNotNull('Name', instance.categoryName);
  writeNotNull('SubCategories', instance.subcategoryModelList);
  return val;
}

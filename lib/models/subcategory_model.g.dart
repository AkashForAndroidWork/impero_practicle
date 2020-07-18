// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubcategoryModel _$SubcategoryModelFromJson(Map<String, dynamic> json) {
  return SubcategoryModel(
    subCategoryId: json['Id'] as int,
    subCategoryName: json['Name'] as String,
    productModelList: (json['Product'] as List)
        ?.map((e) =>
            e == null ? null : ProductModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SubcategoryModelToJson(SubcategoryModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.subCategoryId);
  writeNotNull('Name', instance.subCategoryName);
  writeNotNull('Product', instance.productModelList);
  return val;
}

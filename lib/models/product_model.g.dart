// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    productId: json['Id'] as int,
    productName: json['Name'] as String,
    productPriceCode: json['PriceCode'] as String,
    productImageUrl: json['ImageName'] as String,
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.productId);
  writeNotNull('Name', instance.productName);
  writeNotNull('PriceCode', instance.productPriceCode);
  writeNotNull('ImageName', instance.productImageUrl);
  return val;
}

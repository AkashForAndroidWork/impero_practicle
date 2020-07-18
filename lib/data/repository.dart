import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:impero_practicle/models/category_model.dart';
import 'package:impero_practicle/models/product_model.dart';

import 'api_client.dart';

class Repository {
  final ApiClient apiClient;

  Repository({
    @required this.apiClient,
  });

  static getInstance() {
    return Repository(apiClient: ApiClient(httpClient: http.Client()));
  }

  Future<List<CategoryModel>> getDashboardData() async {
    Map<String, dynamic> requestJsonMap = {
      "CategoryId": 0,
      "DeviceManufacturer": "Google",
      "DeviceModel": "Android SDK built for x86",
      "DeviceToken": " ",
      "PageIndex": 1
    };
    Map<String, dynamic> responseJsonMap = await apiClient.fetchData(
        ApiClient.END_POINT_DASHBOARD, requestJsonMap);

    return (responseJsonMap['Category'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
  }

  Future<List<CategoryModel>> getMoreSubcategoryData(
      int categoryId, int pageIndex) async {
    Map<String, dynamic> requestJsonMap = {
      "CategoryId": categoryId,
      "PageIndex": pageIndex
    };
    Map<String, dynamic> responseJsonMap = await apiClient.fetchData(
        ApiClient.END_POINT_DASHBOARD, requestJsonMap);

    return (responseJsonMap['Category'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
  }

  Future<List<ProductModel>> getMoreProductData(
      int subCategoryId, int pageIndex) async {
    Map<String, dynamic> requestJsonMap = {
      "SubCategoryId": subCategoryId,
      "PageIndex": pageIndex
    };
    List<dynamic> responseJsonMap = await apiClient.fetchData(
        ApiClient.END_POINT_PRODUCT_LIST, requestJsonMap);

    return (responseJsonMap as List)
        ?.map((e) =>
            e == null ? null : ProductModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
  }
}

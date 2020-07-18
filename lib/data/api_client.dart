import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'custom_exception.dart';
import 'error_response_exception.dart';

class ApiClient {
  static const BASE_URL = 'http://esptiles.imperoserver.in/api/API/';
  static const END_POINT_DASHBOARD = 'Product/DashBoard';
  static const END_POINT_PRODUCT_LIST = 'Product/ProductList';

  final http.Client httpClient;

  ApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<dynamic> fetchData(String url, Map<String, dynamic> requestJsonMap) async {
    var responseJson;
    print("$BASE_URL$url\n$requestJsonMap");
    try {
      final response = await httpClient.post("$BASE_URL$url",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(requestJsonMap));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    print(response.body);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        final data = responseJson["Result"];
        final message = responseJson["Message"];
        if (responseJson["Status"]==200) {
          return data;
        }
        if(data is Map<String, dynamic>) {
          throw ErrorResponseException(data, message);
        }
          throw ErrorResponseException(null, message);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

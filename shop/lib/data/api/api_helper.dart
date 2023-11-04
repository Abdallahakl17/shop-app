import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiHelper {
  static late final Dio dio;
  static intia() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      {@required Map<String, dynamic>? query,
      String? token,
      String lang = 'ar',
      required String path}) async {
    dio.options.headers = {
      'Authorization': token,
      'lang': lang,
      'Content-Type': 'application/json'
    };
    return await dio.get(path, queryParameters: query);
  }

  static Future<Response> postData(
      {@required Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String? token,
      String lang = 'ar',
      required String path}) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json'
      };

    return await dio.post(path, queryParameters: query, data: data);
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static  Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

 static Future<Response> getdata({
    required String url,
      Map<String,dynamic>? query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}


import 'package:flutter/material.dart';
import 'package:task_inovola/helpers/dio.dart';
import 'package:task_inovola/models/api_model.dart';
import 'package:dio/dio.dart' as Dio;

class ApiProvider with ChangeNotifier {
  Future<ApiModel> fetchData() async {
    try {
      Dio.Response response = await dio().get(
        '3a1ec9ff-6a95-43cf-8be7-f5daa2122a34',
      );
      return apiModelFromJson(response.toString());
    } catch (err) {
      // print(err);
      rethrow;
    }
  }
}

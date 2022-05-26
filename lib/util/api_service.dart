import 'package:dio/dio.dart';
import 'package:flutt_app/util/constants.dart';
import 'dart:convert';

class ApiService {
  late Dio dio;
  ApiService() {
    var options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = Dio(options);
  }
  login(var data) async {
    print(data);

    return dio.post(ApiConstants.usersEndpoint, data: json.encode(data));
  }
}

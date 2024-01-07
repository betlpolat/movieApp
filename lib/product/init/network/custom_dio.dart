import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../../core/base/model/base_dio.dart';
import '../../../core/base/model/base_model.dart';

class CustomDio with DioMixin implements Dio, BaseDio {
  late final BaseOptions baseOptions;

  CustomDio({required this.baseOptions}) {
    options = baseOptions;
    httpClientAdapter = IOHttpClientAdapter();
  }

  @override
  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await get(path);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;

        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map<String, dynamic>) {
          return model.fromJson(responseBody);
        }
        return responseBody;
    }
  }
}

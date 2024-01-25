import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../utility/constants/path_constant.dart';

/// Product network manager

final class ProductNetworkManager extends NetworkManager<EmptyModel> {
  ProductNetworkManager.base()
      : super(
          options: BaseOptions(
            baseUrl: PathConstant.basePath,
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

  /// Handle error
  /// [onErrorStatus] is error status code [HttpStatus]
  void listenErrorState({required ValueChanged<int> onErrorStatus}) {
    interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          onErrorStatus(e.response?.statusCode ?? HttpStatus.notFound);
          return handler.next(e);
        },
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movie_app/core/base/model/base_dio.dart';
import 'package:movie_app/product/init/network/network_manager.dart';

mixin BaseViewModel {
  final BaseDio customDio = NetworkManager.instance.dio;
}

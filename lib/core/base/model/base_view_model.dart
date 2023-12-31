import 'package:movie_app/core/base/model/base_dio.dart';
import 'package:movie_app/product/init/network/network_manager.dart';

mixin BaseViewModel {
  final BaseDio customDio = NetworkManager.instance.dio;
}

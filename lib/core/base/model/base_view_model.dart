import '../../../product/init/network/network_manager.dart';
import 'base_dio.dart';

mixin BaseViewModel {
  final BaseDio customDio = NetworkManager.instance.dio;
}

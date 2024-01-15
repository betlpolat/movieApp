import 'package:movie_app/product/utility/model/throttle_helper.dart';
import 'package:vexana/vexana.dart';

import '../../network/vexana_manager.dart';

mixin BaseViewModel {
  final INetworkManager networkManager = VexanaManager.instance.networkManager;
  ThrottleHelper throttleHelper = ThrottleHelper();
}

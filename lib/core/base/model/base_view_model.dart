import 'package:vexana/vexana.dart';

import '../../../product/utility/model/throttle_helper.dart';
import '../../network/vexana_manager.dart';

mixin BaseViewModel {
  final INetworkManager networkManager = VexanaManager.instance.networkManager;
  ThrottleHelper throttleHelper = ThrottleHelper();
}

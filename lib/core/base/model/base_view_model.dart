import 'package:vexana/vexana.dart';

import '../../network/vexana_manager.dart';

mixin BaseViewModel {
  final INetworkManager networkManager = VexanaManager.instance.networkManager;
}

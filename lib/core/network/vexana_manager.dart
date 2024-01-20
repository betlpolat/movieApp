import 'package:vexana/vexana.dart';

import '../../product/utility/constants/path_constant.dart';

class VexanaManager {
  VexanaManager.init() {
    _instance ??= VexanaManager._init();
  }
  VexanaManager._init();
  static VexanaManager? _instance;
  INetworkManager networkManager = NetworkManager<EmptyModel>(
    isEnableLogger: true,
    options: BaseOptions(
      baseUrl: PathConstant.basePath,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );
}

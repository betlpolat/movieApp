import 'package:vexana/vexana.dart';

import '../../product/utility/constants/path_constant.dart';

class VexanaManager {
  VexanaManager._init();
  static VexanaManager? _instance;
  static VexanaManager get instance => _instance ??= VexanaManager._init();

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

import 'package:movie_app/product/state/container/product_state_items.dart';
import 'package:vexana/vexana.dart';

import '../../../product/utility/model/throttle_helper.dart';

mixin BaseViewModel {
  final INetworkManager<EmptyModel> networkManager =
      ProductStateItems.productNetworkManager;
  ThrottleHelper throttleHelper = ThrottleHelper();
}

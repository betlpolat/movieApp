import 'package:flutter/material.dart';

import '../../network/manager/product_network_manager.dart';
import '../container/product_state_items.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;
}

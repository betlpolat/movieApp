import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/product/global/theme_notifier.dart';
import 'package:movie_app/product/init/cache/app_cache.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../core/init/core_localize.dart';

@immutable
final class ApplicationInit {
  ApplicationInit._();
  static ApplicationInit instance = ApplicationInit._();
  final CoreLocalize localize = CoreLocalize();

  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<ThemeNotifer>(create: (context) => ThemeNotifer()),
  ];

  Future<void> start() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await AppCache.instance.setUp();
  }
}

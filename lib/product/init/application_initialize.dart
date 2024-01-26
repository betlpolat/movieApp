import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/product/state/container/product_state_container.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../state/view-model/language_notifier.dart';
import '../state/view-model/theme_notifier.dart';
import 'cache/app_cache.dart';
import 'config/app_environment.dart';

@immutable
final class ApplicationInitialize {
  Future<void> start() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error);
    });
  }

  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<ThemeNotifier>(
      create: (context) => ThemeNotifier(),
    ),
    ChangeNotifierProvider<LanguageNotifier>(
      create: (context) => LanguageNotifier(),
    ),
  ];

  static Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    FlutterError.onError = (details) {
      Logger().e(details.exceptionAsString());
    };
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await AppCache.instance.setUp();
    AppEnvironment.setup(config: EnvDev());

    /// It must be call after [AppEnvironment.setup()]
    ProductContainer.setup();
  }
}

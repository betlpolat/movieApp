import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../core/init/core_localize.dart';
import '../state/language_notifier.dart';
import '../state/theme_notifier.dart';
import 'cache/app_cache.dart';

@immutable
final class ApplicationInit {
  ApplicationInit._();
  static ApplicationInit instance = ApplicationInit._();
  final CoreLocalize localize = CoreLocalize.instance;

  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<ThemeNotifier>(
      create: (context) => ThemeNotifier(),
    ),
    ChangeNotifierProvider<LanguageNotifier>(
      create: (context) => LanguageNotifier(),
    )
  ];

  Future<void> start() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await AppCache.instance.setUp();
  }
}

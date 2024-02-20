import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/feature/detail/view/detail_view.dart';
import 'package:movie_app/feature/home/view/home_view.dart';
import 'package:movie_app/feature/home/view/widget/index.dart';
import 'package:movie_app/feature/home/view/widget/search_text_field.dart';
import 'package:movie_app/main.dart' as app;
import 'package:movie_app/product/state/index.dart';
import 'package:movie_app/product/widget/animation/loading_lottie.dart';
import 'package:movie_app/product/widget/button/arrow_back_icon_button.dart';
import 'package:movie_app/product/widget/button/language_button.dart';
import 'package:movie_app/product/widget/button/movie_button.dart';
import 'package:movie_app/product/widget/button/theme/theme_button.dart';

void main() {
  testWidgets('Home View init  ', (tester) async {
    await restoreFlutterError(() async {
      await app.main();
    });
    await tester.pumpWidget(const LoadingLottie());
    await tester.pumpAndSettle();

    expect(find.byType(HomeView), findsOneWidget);
  });

  testWidgets('search text field ', (tester) async {
    await restoreFlutterError(() async {
      await app.main();
    });
    await tester.pumpWidget(const LoadingLottie());
    await tester.pumpAndSettle();
    await tester.tap(find.byType(SearchTextField));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(SearchTextField), 'testing');
    await tester.pumpAndSettle();

    expect(find.text('testing'), findsOneWidget);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('search card')).first);
    await tester.pumpAndSettle();

    expect(find.byType(DetailView), findsOneWidget);
  });

  testWidgets('change language for initial language English ', (tester) async {
    await restoreFlutterError(() async {
      await app.main();
    });
    await tester.pumpWidget(const LoadingLottie());
    await tester.pumpAndSettle();

    expect(find.byType(HomeView), findsOneWidget);
    expect(find.text('Trending Movies'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byType(LanguageButton), findsOneWidget);
    await tester.tap(find.byType(LanguageButton));
    await tester.pumpAndSettle();

    expect(find.text('Trend Filme'), findsOneWidget);
  });

  testWidgets('change theme ', (tester) async {
    await restoreFlutterError(() async {
      await app.main();
    });
    final notifier = ThemeNotifier();
    await tester.pumpAndSettle();
    expect(find.byType(ThemeButton), findsOneWidget);
    await tester.tap(find.byType(ThemeButton));
    await tester.pumpAndSettle();
    final newNotifier = ThemeNotifier();
    notifier.currentTheme.brightness == Brightness.light
        ? expect(newNotifier.currentTheme.brightness, Brightness.dark)
        : expect(newNotifier.currentTheme.brightness, Brightness.light);
  });

  testWidgets('change language for initial language German ', (tester) async {
    await restoreFlutterError(() async {
      await app.main();
    });
    await tester.pumpWidget(const LoadingLottie());
    await tester.pumpAndSettle();

    expect(find.byType(HomeView), findsOneWidget);
    expect(find.text('Trend Filme'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byType(LanguageButton), findsOneWidget);
    await tester.tap(find.byType(LanguageButton));
    await tester.pumpAndSettle();

    expect(find.text('Trending Movies'), findsOneWidget);
  });

  testWidgets('navigate to Detail View and come back Home View ',
      (tester) async {
    await restoreFlutterError(() async {
      await app.main();
    });
    await tester.pumpWidget(const LoadingLottie());
    await tester.pumpAndSettle();

    expect(find.byType(HomeView), findsOneWidget);
    expect(find.text('Trending Movies'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byType(MovieItems), findsWidgets);
    await tester.pumpAndSettle();
    const Duration(seconds: 10);
    await tester.tap(find.byType(MovieButton).first);

    await tester.pumpAndSettle();

    expect(find.byType(DetailView), findsOneWidget);

    await tester.tap(find.byType(ArrowBackIconButton));
    await tester.pumpAndSettle();

    expect(find.byType(HomeView), findsOneWidget);
  });
}

Future<void> restoreFlutterError(Future<void> Function() call) async {
  final originalOnError = FlutterError.onError!;
  await call();
  final overriddenOnError = FlutterError.onError!;

  // restore FlutterError.onError
  FlutterError.onError = (FlutterErrorDetails details) {
    if (overriddenOnError != originalOnError) overriddenOnError(details);
    originalOnError(details);
  };
}

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/feature/home/view/home_view.dart';
import 'package:movie_app/main.dart' as app;
import 'package:movie_app/product/widget/animation/loading_lottie.dart';
import 'package:movie_app/product/widget/button/language_button.dart';

void main() {
  group('Home Integration Test', () {
    testWidgets('', (tester) async {
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

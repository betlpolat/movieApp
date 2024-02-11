import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/feature/home/view/widget/search_text_field.dart';
import 'package:movie_app/product/widget/button/language_button.dart';

void main() {
  setUp(() {});
  testWidgets(
    'Language Button Test',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LanguageButton(
              onPressed: null,
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.language_outlined), findsOneWidget);
    },
  );

  testWidgets('Search Text Field Test', (tester) async {
    final controller = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchTextField(
            controller: controller,
            onChanged: (String value) {},
          ),
        ),
      ),
    );

    final textField = find.byType(TextField);

    expect(textField, findsOneWidget);
  });
}

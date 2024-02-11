import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/feature/detail/view/widget/rating_field.dart';
import 'package:movie_app/feature/detail/view/widget/release_field.dart';
import 'package:movie_app/product/widget/decoration/custom_field.dart';
import 'package:movie_app/product/widget/text/custom_field_text.dart';

void main() {
  setUp(() {});
  testWidgets('Custom Field Test', (tester) async {
    const text = Text('Custom Field');
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: CustomField(child: text)),
      ),
    );
    final textWidget = find.byType(Text);

    expect(textWidget, findsOneWidget);
    expect(find.text('Custom Field'), findsOneWidget);
  });

  testWidgets('Rating Field Test', (tester) async {
    const num voteAverage = 20;
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: RatingField(voteAverage: voteAverage)),
      ),
    );

    expect(find.text('${voteAverage.toStringAsFixed(1)}/10'), findsOneWidget);
  });

  testWidgets('Release Field Test', (tester) async {
    const date = '01.05.1997';
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: ReleaseField(releaseDate: date)),
      ),
    );
    final textField = find.byType(CustomFieldText);

    expect(textField, findsOneWidget);
  });
}

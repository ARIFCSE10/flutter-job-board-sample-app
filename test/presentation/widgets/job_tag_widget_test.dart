import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_board/presentation/widgets/job_tag_widget.dart';

void main() {
  testWidgets('JobTagWidget displays correct tag text',
      (WidgetTester tester) async {
    const tagText = 'Full-time';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: JobTagWidget(tag: tagText),
        ),
      ),
    );

    // Verify that the tag text is displayed
    expect(find.text(tagText), findsOneWidget);

    // Verify that the widget has the correct shape (rounded rectangle)
    final container = tester.widget<Container>(find.byType(Container));
    expect(container.decoration, isA<BoxDecoration>());
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.borderRadius, isNotNull);

    // Verify that the text style is applied correctly
    final textWidget = tester.widget<Text>(find.text(tagText));
    expect(textWidget.style, isNotNull);
    expect(textWidget.style!.fontSize, 12);
    expect(textWidget.style!.fontWeight, FontWeight.w500);
  });
}

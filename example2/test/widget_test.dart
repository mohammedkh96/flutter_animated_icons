import 'package:flutter_test/flutter_test.dart';

import 'package:example2/main.dart';

void main() {
  testWidgets('Flutter Animated Icons example smoke test', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app title is displayed
    expect(find.text('Flutter Animated Icons Demo'), findsOneWidget);

    // Verify that the instruction text is displayed
    expect(find.text('Tap any icon to animate it!'), findsOneWidget);

    // Verify that the header text is displayed
    expect(
      find.text('2,454+ Animated Icons from 5 Premium Libraries'),
      findsOneWidget,
    );
  });
}

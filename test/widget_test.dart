// This is a basic Flutter widget test for the animated icons package.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_icons_animated/flutter_animated_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Animated Icons app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app title is displayed.
    expect(find.text('Animated Icons'), findsOneWidget);

    // Verify that we have IconButtons (the animated icons).
    expect(find.byType(IconButton), findsWidgets);

    // Verify that we have Lottie widgets (the animated icons).
    expect(find.byType(Lottie), findsWidgets);

    // Test tapping on the first icon button to trigger animation.
    final firstIconButton = find.byType(IconButton).first;
    await tester.tap(firstIconButton);
    await tester.pump();

    // Verify the app is still running without errors.
    expect(find.text('Animated Icons'), findsOneWidget);
  });

  testWidgets('IconButton tap triggers animation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Find the first IconButton
    final firstIconButton = find.byType(IconButton).first;
    
    // Verify it exists
    expect(firstIconButton, findsOneWidget);

    // Tap the button
    await tester.tap(firstIconButton);
    await tester.pump();

    // Verify the app is still responsive
    expect(find.text('Animated Icons'), findsOneWidget);
  });
}

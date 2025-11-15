// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:corpfinity/main.dart';

void main() {
  testWidgets('Loads sign up page and validates email form', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Sign up with Email'), findsOneWidget);
    await tester.tap(find.text('Sign up with Email'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).at(1), 'invalid');
    final createBtn = find.widgetWithText(FilledButton, 'Create Account');
    await tester.ensureVisible(createBtn.first);
    await tester.tap(createBtn.first);
    await tester.pump();
    expect(find.text('Enter a valid email'), findsOneWidget);
  });
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tp4_alertes/main.dart';

void main() {
  testWidgets('TP4 page loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: PageAlertes()));

    expect(find.text('TP 4 – Alertes natives'), findsOneWidget);
    expect(find.text('1. Notification native'), findsOneWidget);
    expect(find.text('4. Surveillance continue (service au premier plan)'), findsOneWidget);
  });
}

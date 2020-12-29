import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_bits/ui_bits.dart';

extension TesterExtensions on WidgetTester {
  Future pumpApp(Widget child) async {
    var factory = ThemeFactory();
    await this.pumpWidget(
      MaterialApp(
        theme: factory.makeBlueTheme(),
        home: Scaffold(
          body: factory.makeHome(child: child),
        ),
      ),
    );
    await this.pumpAndSettle();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_bits/components/inputs.dart';
import 'package:ui_bits/ui_bits.dart';

void main() {
  testWidgets('tapping button calls the given callback', (tester) async {
    var wasCalled = false;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PrimaryButton(
          onTap: () => wasCalled = true,
          label: 'myButton',
        ),
      ),
    ));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(PrimaryButton));

    expect(wasCalled, isTrue);
  });
}

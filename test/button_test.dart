import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_bits/ui_bits.dart';

void main() {
  testWidgets('tapping button calls the given callback', (tester) async {
    var wasCalled = false;
    await pumpApp(
      tester,
      BitPrimaryButton(
        onTap: () => wasCalled = true,
        label: 'myButton',
      ),
    );

    await tester.tap(find.byType(BitPrimaryButton));

    expect(wasCalled, isTrue);
  });
}

Future pumpApp(WidgetTester tester, BitPrimaryButton bitPrimaryButton) async {
  var factory = ThemeFactory();
  await tester.pumpWidget(
    MaterialApp(
      theme: factory.makeBlueTheme(),
      home: Scaffold(
        body: factory.makeHome(child: bitPrimaryButton),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

import 'package:flutter_test/flutter_test.dart';
import 'package:ui_bits/ui_bits.dart';
import 'tester_extensions.dart';

void main() {
  testWidgets('tapping button calls the given callback', (tester) async {
    var wasCalled = false;
    await tester.pumpApp(
      BitPrimaryButton(
        onTap: () => wasCalled = true,
        label: 'myButton',
      ),
    );

    await tester.tap(find.byType(BitPrimaryButton));

    expect(wasCalled, isTrue);
  });
}

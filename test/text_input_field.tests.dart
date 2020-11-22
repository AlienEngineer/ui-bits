import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_bits/ui_bits.dart';

void main() {
  [
    (field) => makeTextInputField(field),
    (field) => makePasswordInputField(field),
  ].forEach((makeTestCase) {
    Future pumpWidget(WidgetTester tester, Field<String> field) async {
      await tester.pumpWidget(makeTestCase(field)['widget']);
    }

    group('input: ${makeTestCase(null)['type']}', () {
      testWidgets('getting value from field returns what was entered',
          (tester) async {
        final Field<String> field = Field<String>();
        await pumpWidget(tester, field);

        await tester.enterText(find.byType(TextField), 'some text');

        expect(field.getValue(), 'some text');
      });

      testWidgets('when field is null entered value is present',
          (tester) async {
        final Field<String> field = null;
        await pumpWidget(tester, field);

        await tester.enterText(find.byType(TextField), 'some text');

        expect(find.text('some text'), findsOneWidget);
      });

      testWidgets('field use field initial value', (tester) async {
        final Field<String> field = Field<String>(initialValue: 'some value');

        await pumpWidget(tester, field);

        expect(field.getValue(), 'some value');
      });

      testWidgets('field is empty when initial value is null', (tester) async {
        final Field<String> field = Field<String>();

        await pumpWidget(tester, field);

        expect(field.getValue(), '');
      });
    });
  });
}

Map<String, dynamic> makeTextInputField(Field<String> field) {
  return {
    'type': TextInputField,
    'widget': MaterialApp(
      home: Scaffold(
        body: TextInputField(
          FieldLabels(
            label: 'myLabel',
            icon: Icons.add,
          ),
          field: field,
        ),
      ),
    ),
  };
}

Map<String, dynamic> makePasswordInputField(Field<String> field) {
  return {
    'type': PasswordInputField,
    'widget': MaterialApp(
      home: Scaffold(
        body: PasswordInputField(
          FieldLabels(
            label: 'myLabel',
            icon: Icons.add,
          ),
          field: field,
        ),
      ),
    ),
  };
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_bits/components/components.dart';

class BitTextInputField extends StatelessWidget {
  final FieldLabels messages;
  final Field<String> field;

  const BitTextInputField(
    this.messages, {
    this.field,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: field?.controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: messages.label,
        prefixIcon: BitInputFieldIcon(messages.icon),
      ),
    );
  }
}

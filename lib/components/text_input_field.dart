import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_bits/components/inputs.dart';

class TextInputField extends StatelessWidget {
  final FieldLabels messages;
  final Field<String> field;

  const TextInputField(
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
        prefixIcon: InputFieldIcon(messages.icon),
      ),
    );
  }
}

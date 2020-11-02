import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_bits/components/inputs.dart';

class TextInputField extends StatelessWidget {
  final String initialValue;
  final FieldLabels messages;

  const TextInputField(
    this.messages, {
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: messages.label,
        prefixIcon: InputFieldIcon(messages.icon),
      ),
    );
  }
}

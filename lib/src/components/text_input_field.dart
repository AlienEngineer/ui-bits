import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_bits/src/ui_bits_internal.dart';

class BitInputTextField extends StatelessWidget {
  final FieldLabels messages;
  final Field<String> field;
  final BitAnimation animation;

  const BitInputTextField(
    this.messages, {
    this.field,
    this.animation = const BitNoAnimation(),
  });

  @override
  Widget build(BuildContext context) {
    return animation.wrapWidget(
      child: TextFormField(
        controller: field?.controller,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          labelText: messages.label,
          prefixIcon: BitInputFieldIcon(messages.icon),
        ),
      ),
    );
  }
}

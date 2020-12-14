import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_bits/animations/animations.dart';
import 'package:ui_bits/components/components.dart';

class BitPasswordInputField extends StatefulWidget {
  final Duration fadeInDelay;
  final Duration fadeInDuration;
  final FieldLabels messages;
  final AnimationRegistry animateAfter;
  final Field<String> field;

  const BitPasswordInputField(
    this.messages, {
    this.animateAfter = const StubRegistry(),
    this.fadeInDelay = const Duration(milliseconds: 700),
    this.fadeInDuration = const Duration(milliseconds: 150),
    this.field,
  });

  @override
  _BitPasswordInputFieldState createState() => _BitPasswordInputFieldState();
}

class _BitPasswordInputFieldState extends State<BitPasswordInputField> {
  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      controller: widget.field?.controller,
      decoration: InputDecoration(
        labelText: widget.messages.label,
        prefixIcon: BitInputFieldIcon(widget.messages.icon),
        suffixIcon: _buildSuffixIcon(context),
      ),
    );
  }

  Widget _buildSuffixIcon(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _obscureText = !_obscureText),
      child: BitFadeInAnimation(
        duration: widget.fadeInDuration,
        animateAfter: widget.animateAfter,
        child: BitToggleAnimation(
          _obscureText,
          BitInputFieldIcon(Icons.visibility),
          BitInputFieldIcon(Icons.visibility_off),
        ),
      ),
    );
  }
}

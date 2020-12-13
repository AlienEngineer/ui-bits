import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_bits/animations/animations.dart';
import 'package:ui_bits/components/components.dart';

class PasswordInputField extends StatefulWidget {
  final Duration fadeInDelay;
  final Duration fadeInDuration;
  final FieldLabels messages;
  final AnimationRegistry animateAfter;
  final Field<String> field;

  const PasswordInputField(
    this.messages, {
    this.animateAfter = const StubRegistry(),
    this.fadeInDelay = const Duration(milliseconds: 700),
    this.fadeInDuration = const Duration(milliseconds: 150),
    this.field,
  });

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      controller: widget.field?.controller,
      decoration: InputDecoration(
        labelText: widget.messages.label,
        prefixIcon: InputFieldIcon(widget.messages.icon),
        suffixIcon: _buildSuffixIcon(context),
      ),
    );
  }

  Widget _buildSuffixIcon(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _obscureText = !_obscureText),
      child: FadeInAnimation(
        duration: widget.fadeInDuration,
        animateAfter: widget.animateAfter,
        child: ToggleAnimation(
          _obscureText,
          InputFieldIcon(Icons.visibility),
          InputFieldIcon(Icons.visibility_off),
        ),
      ),
    );
  }
}

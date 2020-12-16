import 'package:flutter/widgets.dart';
import 'package:ui_bits/internal_ui_bits.dart';

class BitAnimatedTextField extends StatelessWidget {
  final FieldLabels messages;
  final AnimationRegistry animateAfter;
  final Field<String> field;

  const BitAnimatedTextField({
    Key key,
    this.messages,
    this.field,
    this.animateAfter = const StubRegistry(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BitWidthAnimationWidget(
      duration: context.animation.long,
      animateAfter: animateAfter,
      width: context.calculateCardWidth(),
      child: BitInputTextField(
        messages,
        field: field,
      ),
    );
  }
}

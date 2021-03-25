import 'package:ui_bits/ui_bits.dart';
import 'package:flutter/widgets.dart';

class InputsPageSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BitScrollable(
      children: [
        Container(
          width: 400,
          child: BitCheckBox(
            label: 'BitLeftOrientation',
          ),
        ),
        Container(
          width: 400,
          child: BitCheckBox(
            orientation: const BitTopOrientation(),
            label: 'BitTopOrientation',
          ),
        ),
      ],
    );
  }
}

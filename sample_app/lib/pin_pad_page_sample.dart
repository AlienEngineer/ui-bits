import 'package:flutter/widgets.dart';
import 'package:ui_bits/ui_bits.dart';

class PinPadPageSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pinField = Field.asText();
    return Container(
      child: Column(
        children: [
          BitInputPasswordField(
            const FieldLabels(
              label: 'Pin',
              icon: FontAwesomeIcons.solidUserCircle,
            ),
            field: pinField,
          ),
          SizedBox(height: context.sizes.extraLarge),
          BitPinPad(
            animation: BitAnimations.scale(),
            pinField: pinField,
          ),
        ],
      ),
    );
  }
}

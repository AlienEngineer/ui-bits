import 'package:ui_bits/ui_bits.dart';
import 'package:flutter/widgets.dart';

class LoadingPageSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BitScrollable(
      children: [
        Container(
          color: context.theme.primaryColor,
          child: BitMediumPadding(
            child: BitLoading(scheme: BitScheme.primary(context)),
          ),
        ),
        Container(
          child: BitMediumPadding(
            child: BitLoading(scheme: BitScheme.secondary(context)),
          ),
        ),
        Container(
          width: 200.0,
          height: 100.0,
          child: BitMediumPadding(
            child: BitLoading(scheme: BitScheme.secondary(context)),
          ),
        ),
        Container(
          width: 200.0,
          height: 100.0,
          color: context.theme.primaryColor,
          child: BitMediumPadding(
            child: BitLoading(scheme: BitScheme.primary(context)),
          ),
        ),
      ],
    );
  }
}

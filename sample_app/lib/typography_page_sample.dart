import 'package:flutter/widgets.dart';
import 'package:ui_bits/ui_bits.dart';

class TypographyPageSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          BitText('BitTextStyles.h1', style: BitTextStyles.h1),
          BitText('BitTextStyles.h2', style: BitTextStyles.h2),
          BitText('BitTextStyles.h3', style: BitTextStyles.h3),
          BitText('BitTextStyles.h4', style: BitTextStyles.h4),
          BitText('BitTextStyles.h5', style: BitTextStyles.h5),
          BitText('BitTextStyles.h6', style: BitTextStyles.h6),
          BitText('BitTextStyles.body1', style: BitTextStyles.body1),
          BitText('BitTextStyles.body2', style: BitTextStyles.body2),
          BitText('BitTextStyles.caption', style: BitTextStyles.caption),
          BitText('BitTextStyles.subtitle1', style: BitTextStyles.subtitle1),
          BitText('BitTextStyles.subtitle2', style: BitTextStyles.subtitle2),
        ],
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:ui_bits/ui_bits.dart';

class TypographyPageSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BitScrollable(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BitText('Default', style: BitTextStyles.h1),
              buildTextSamples((style) => style),
            ],
          ),
          SizedBox(height: context.sizes.medium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: context.theme.primaryColor,
                child: BitText('asSecondary',
                    style: BitTextStyles.h1.asSecondary(context)),
              ),
              Container(
                color: context.theme.primaryColor,
                child: buildTextSamples((style) => style.asSecondary(context)),
              ),
            ],
          ),
          SizedBox(height: context.sizes.medium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BitText('asPrimary', style: BitTextStyles.h1.asPrimary(context)),
              buildTextSamples((style) => style.asPrimary(context)),
            ],
          ),
        ],
      ),
    );
  }

  Column buildTextSamples(
    BitTextStyleFactory Function(TextColorVariations) transform,
  ) {
    return Column(
      children: [
        BitText('BitTextStyles.h1', style: transform(BitTextStyles.h1)),
        BitText('BitTextStyles.h2', style: transform(BitTextStyles.h2)),
        BitText('BitTextStyles.h3', style: transform(BitTextStyles.h3)),
        BitText('BitTextStyles.h4', style: transform(BitTextStyles.h4)),
        BitText('BitTextStyles.h5', style: transform(BitTextStyles.h5)),
        BitText('BitTextStyles.h6', style: transform(BitTextStyles.h6)),
        BitText('BitTextStyles.body1', style: transform(BitTextStyles.body1)),
        BitText('BitTextStyles.body2', style: transform(BitTextStyles.body2)),
        BitText('BitTextStyles.caption',
            style: transform(BitTextStyles.caption)),
        BitText('BitTextStyles.subtitle1',
            style: transform(BitTextStyles.subtitle1)),
        BitText('BitTextStyles.subtitle2',
            style: transform(BitTextStyles.subtitle2)),
      ],
    );
  }
}

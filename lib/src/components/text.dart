import 'package:ui_bits/src/ui_bits_internal.dart';

class BitText extends StatelessWidget {
  final String text;
  final BitTextStyleFactory style;

  const BitText(
    this.text, {
    Key key,
    this.style = BitTextStyles.h3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.make(context),
    );
  }
}

abstract class BitTextStyleFactory {
  TextStyle make(BuildContext context);
}

class BitTextStyles {
  static const BitTextStyleFactory subtitle1 = _Subtitle1TextStyleFactory();
  static const BitTextStyleFactory subtitle2 = _Subtitle2TextStyleFactory();
  static const BitTextStyleFactory caption = _CaptionTextStyleFactory();
  static const BitTextStyleFactory body1 = _Body1TextStyleFactory();
  static const BitTextStyleFactory body2 = _Body2TextStyleFactory();
  static const BitTextStyleFactory h1 = _H1TextStyleFactory();
  static const BitTextStyleFactory h2 = _H2TextStyleFactory();
  static const BitTextStyleFactory h3 = _H3TextStyleFactory();
  static const BitTextStyleFactory h4 = _H4TextStyleFactory();
  static const BitTextStyleFactory h5 = _H5TextStyleFactory();
  static const BitTextStyleFactory h6 = _H6TextStyleFactory();
}

class _Subtitle1TextStyleFactory implements BitTextStyleFactory {
  const _Subtitle1TextStyleFactory();
  @override
  TextStyle make(BuildContext context) => context.theme.textTheme.subtitle1;
}

class _Subtitle2TextStyleFactory implements BitTextStyleFactory {
  const _Subtitle2TextStyleFactory();
  @override
  TextStyle make(BuildContext context) => context.theme.textTheme.subtitle2;
}

class _CaptionTextStyleFactory implements BitTextStyleFactory {
  const _CaptionTextStyleFactory();
  @override
  TextStyle make(BuildContext context) => context.theme.textTheme.caption;
}

class _Body1TextStyleFactory implements BitTextStyleFactory {
  const _Body1TextStyleFactory();
  @override
  TextStyle make(BuildContext context) => context.theme.textTheme.bodyText1;
}

class _Body2TextStyleFactory implements BitTextStyleFactory {
  const _Body2TextStyleFactory();
  @override
  TextStyle make(BuildContext context) => context.theme.textTheme.bodyText2;
}

class _H1TextStyleFactory implements BitTextStyleFactory {
  const _H1TextStyleFactory();
  @override
  TextStyle make(BuildContext context) => context.theme.textTheme.headline1;
}

class _H2TextStyleFactory implements BitTextStyleFactory {
  const _H2TextStyleFactory();
  @override
  TextStyle make(BuildContext context) => context.theme.textTheme.headline2;
}

class _H3TextStyleFactory implements BitTextStyleFactory {
  const _H3TextStyleFactory();
  @override
  TextStyle make(BuildContext context) => context.theme.textTheme.headline3;
}

class _H4TextStyleFactory implements BitTextStyleFactory {
  const _H4TextStyleFactory();
  @override
  TextStyle make(BuildContext context) => context.theme.textTheme.headline4;
}

class _H5TextStyleFactory implements BitTextStyleFactory {
  const _H5TextStyleFactory();
  @override
  TextStyle make(BuildContext context) => context.theme.textTheme.headline5;
}

class _H6TextStyleFactory implements BitTextStyleFactory {
  const _H6TextStyleFactory();
  @override
  TextStyle make(BuildContext context) => context.theme.textTheme.headline6;
}

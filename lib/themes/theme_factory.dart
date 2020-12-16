import 'package:flutter/material.dart';
import 'package:ui_bits/components/card.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  BitSizes get sizes => BitTheme.of(this).size;

  BitBorders get borders {
    var widgetBorders = BitTheme.of(this).borders;
    widgetBorders.setContext(this);
    return widgetBorders;
  }

  BitAnimationDurations get animation => BitTheme.of(this).animations;

  double calculateCardWidth() => CardSize.of(this)?.calculateWidth(this);
}

class ThemeFactory {
  Widget makeHome({Widget child}) {
    return BitTheme(
      child: child,
      size: BitSizes(
        small: 10.0,
        mediumSmall: 16.0,
        medium: 20.0,
      ),
      borders: BitBorders(),
      animations: BitAnimationDurations(),
    );
  }

  ThemeData makeBlueTheme() {
    var primaryColor = Colors.blue;
    var secondaryColor = Colors.grey;
    var backgroundColor = Colors.white;
    var labelColor = Colors.black87.withOpacity(0.4);

    return _makeTheme(
      primaryColor,
      backgroundColor,
      secondaryColor,
      labelColor,
    );
  }

  ThemeData makePurpleTheme() {
    var primaryColor = Colors.deepPurple;
    var secondaryColor = Colors.grey;
    var backgroundColor = Colors.white;
    var labelColor = Colors.black87.withOpacity(0.4);

    return _makeTheme(
      primaryColor,
      backgroundColor,
      secondaryColor,
      labelColor,
    );
  }

  ThemeData _makeTheme(
    Color primaryColor,
    Color backgroundColor,
    Color secondaryColor,
    Color labelColor,
  ) {
    var theme = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
      ),
      accentColor: primaryColor,
      primaryColor: primaryColor,
      primarySwatch: primaryColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColor,
        selectionColor: primaryColor,
        selectionHandleColor: primaryColor,
      ),
      backgroundColor: backgroundColor,
      canvasColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: Color.alphaBlend(
        backgroundColor.withOpacity(0.7),
        secondaryColor.withOpacity(0.4),
      ),
      // context: Copy | Cut | Paste
      hintColor: labelColor,
      highlightColor: Colors.amberAccent,
      focusColor: Colors.amberAccent,
      buttonColor: Colors.amberAccent,
      indicatorColor: Colors.amberAccent,
      splashColor: Colors.amberAccent,
      hoverColor: Colors.amberAccent,
      dividerColor: Colors.amberAccent,
      toggleableActiveColor: Colors.amberAccent,
      bottomAppBarColor: Colors.amberAccent,
      dialogBackgroundColor: Colors.amberAccent,
      disabledColor: Colors.amberAccent,
      errorColor: Colors.amberAccent,
      secondaryHeaderColor: Colors.amberAccent,
      selectedRowColor: Colors.amberAccent,
      unselectedWidgetColor: Colors.amberAccent,
      primaryColorDark: Colors.amberAccent,
      primaryColorLight: Colors.amberAccent,
    );

    return theme.copyWith(
      // chipTheme: buildChipThemeData(),
      inputDecorationTheme: _buildInputDecorationTheme(theme),
      textTheme: _buildTextTheme(theme),
      floatingActionButtonTheme: _buildFloatingActionButtonThemeData(theme),
    );
  }

  static FloatingActionButtonThemeData _buildFloatingActionButtonThemeData(
    ThemeData theme,
  ) {
    return FloatingActionButtonThemeData(
      backgroundColor: theme.primaryColor,
      elevation: 4.0,
      highlightElevation: 2.0,
      shape: StadiumBorder(),
    );
  }

  static TextTheme _buildTextTheme(ThemeData theme) {
    return theme.textTheme.copyWith(
      button: TextStyle(color: theme.backgroundColor, fontFamily: 'Open Sans'),
      subtitle1: TextStyle(color: theme.hintColor, fontFamily: 'Open Sans'),
      subtitle2: TextStyle(color: theme.hintColor, fontFamily: 'Open Sans'),
      caption: TextStyle(color: Colors.amberAccent, fontFamily: 'Open Sans'),
      bodyText1: TextStyle(color: theme.hintColor, fontFamily: 'Open Sans'),
      bodyText2: TextStyle(color: Colors.amberAccent, fontFamily: 'Open Sans'),
      headline1: TextStyle(color: theme.hintColor, fontFamily: 'Open Sans'),
      headline2: TextStyle(color: theme.hintColor, fontFamily: 'Open Sans'),
      headline3: TextStyle(color: Colors.amberAccent, fontFamily: 'Open Sans'),
      headline4: TextStyle(color: Colors.amberAccent, fontFamily: 'Open Sans'),
      headline5: TextStyle(color: Colors.amberAccent, fontFamily: 'Open Sans'),
      headline6: TextStyle(color: Colors.amberAccent, fontFamily: 'Open Sans'),
    );
  }

  static InputDecorationTheme _buildInputDecorationTheme(ThemeData theme) {
    final roundBorderRadius = BorderRadius.circular(100);
    final primaryColor = theme.primaryColor;

    return theme.inputDecorationTheme.copyWith(
      filled: true,
      fillColor: primaryColor.withOpacity(0.1),
      focusedBorder: OutlineInputBorder(
        borderRadius: roundBorderRadius,
        borderSide: BorderSide(
          color: theme.primaryColor,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: roundBorderRadius,
        borderSide: BorderSide(
          width: 0.0,
          style: BorderStyle.none,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: roundBorderRadius,
      ),
    );
  }
}

class BitTheme extends InheritedWidget {
  final BitSizes size;
  final BitBorders borders;
  final BitAnimationDurations animations;

  const BitTheme({
    Key key,
    this.size,
    this.borders,
    this.animations,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return oldWidget as BitTheme != this;
  }

  static BitTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BitTheme>();
  }
}

class BitAnimationDurations {
  final Duration extraShort;
  final Duration short;
  final Duration medium;
  final Duration long;

  BitAnimationDurations({
    this.extraShort = const Duration(milliseconds: 150),
    this.short = const Duration(milliseconds: 250),
    this.medium = const Duration(milliseconds: 700),
    this.long = const Duration(milliseconds: 1150),
  });
}

class BitSizes {
  final double small;
  final double medium;
  final double mediumSmall;

  const BitSizes({
    this.small,
    this.mediumSmall,
    this.medium,
  });
}

class BitBorders {
  BuildContext context;

  Border get round {
    return Border.all(
      width: 1.2,
      color: context.theme.primaryColor,
    );
  }

  void setContext(BuildContext buildContext) {
    context = buildContext;
  }
}

import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
}

class PurpleThemeFactory {
  ThemeData makeTheme() {
    var primaryColor = Colors.deepPurple;
    var secondaryColor = Colors.grey;
    var backgroundColor = Colors.white;
    var labelColor = Colors.black87.withOpacity(0.4);

    var theme = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
      ),
      accentColor: primaryColor,
      primaryColor: primaryColor,
      primarySwatch: primaryColor,
      cursorColor: primaryColor,
      textSelectionHandleColor: primaryColor,
      backgroundColor: backgroundColor,
      canvasColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: Color.alphaBlend(
        backgroundColor.withOpacity(0.7),
        secondaryColor.withOpacity(0.4),
      ), // context: Copy | Cut | Paste
      textSelectionColor: secondaryColor,
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
      ThemeData theme) {
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
      bodyText1: TextStyle(color: Colors.amberAccent, fontFamily: 'Open Sans'),
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
      border: new OutlineInputBorder(
        borderRadius: roundBorderRadius,
      ),
    );
  }
}

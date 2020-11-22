import 'package:flutter/widgets.dart';

class Field<T> {
  final TextEditingController controller;

  Field({T initialValue})
      : controller = TextEditingController(
          text: convertToString<T>(initialValue),
        );

  void printValues() {
    controller.addListener(() {
      print(controller.text);
    });
  }

  void dispose() {
    controller.dispose();
  }

  T getValue() {
    return convertToType(controller.text);
  }

  T convertToType(String text) {
    return text as T;
  }

  static String convertToString<T>(T initialValue) {
    return initialValue == null ? null : initialValue.toString();
  }
}

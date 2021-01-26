import 'package:flutter/widgets.dart';

abstract class Field<T> {
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

  void onChange(void Function(T data) callback) {
    controller.addListener(() {
      callback(getValue());
    });
  }

  void dispose() {
    controller.clear();
    controller.dispose();
  }

  T getValue();

  T convertToType(String text) => text as T;

  static String convertToString<T>(T initialValue) =>
      initialValue == null ? null : initialValue.toString();

  void setValue(T value) => controller.text = value.toString();

  @override
  String toString() => controller.text;

  static Field<bool> asBool() => _FieldBool();

  static Field<String> asText({String initialValue = ''}) =>
      _FieldText(initialValue);

  static Field<double> asDouble() => _FieldDouble();

  Widget _onChange(Widget Function(T value) callback) {
    return _OnFieldChangeBuilder<T>(controller, callback, this);
  }
}

class _FieldDouble extends Field<double> {
  _FieldDouble() : super(initialValue: 0.0);

  @override
  double getValue() => double.parse(controller.text);
}

class _FieldText extends Field<String> {
  _FieldText([String initialValue]) : super(initialValue: initialValue);

  @override
  String getValue() => controller.text;
}

class _FieldBool extends Field<bool> {
  _FieldBool() : super(initialValue: false);

  @override
  bool getValue() => controller.text.toLowerCase() == 'true';
}

class _OnFieldChangeBuilder<T> extends StatefulWidget {
  final TextEditingController controller;
  final Widget Function(T value) callback;
  final Field<T> field;

  _OnFieldChangeBuilder(this.controller, this.callback, this.field);

  @override
  __OnFieldChangeBuilderState createState() => __OnFieldChangeBuilderState<T>();
}

class __OnFieldChangeBuilderState<T> extends State<_OnFieldChangeBuilder<T>> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.callback(widget.field.getValue());
  }
}

class BitObservable<T> extends StatelessWidget {
  final Field<T> field;
  final Widget Function(T value) builder;
  final Map<T, StatelessWidget> buildByState;

  BitObservable({
    this.field,
    this.builder,
    this.buildByState,
  });

  @override
  Widget build(BuildContext context) {
    if (builder != null) {
      return field._onChange(builder);
    }

    if (buildByState != null) {
      return field._onChange((value) => buildByState[value]);
    }

    throw UnableToBuildError();
  }
}

class UnableToBuildError extends Error {
  UnableToBuildError();

  @override
  String toString() => 'Unable to build with the provided builders.';
}

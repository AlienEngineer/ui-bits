import 'package:flutter/widgets.dart';

typedef void Func<T>(T data);

abstract class Field<T> {
  final TextEditingController controller;

  Field({T initialValue})
      : controller = TextEditingController(
          text: _convertToString<T>(initialValue),
        );

  void onChange(Func<T> callback) {
    controller.addListener(() {
      callback(getValue());
    });
  }

  void dispose() {
    controller.clear();
    controller.dispose();
  }

  T getValue();

  static String _convertToString<T>(T initialValue) =>
      initialValue == null ? null : initialValue.toString();

  void setValue(T value) => controller.text = value.toString();

  @override
  String toString() => controller.text;

  Widget _buildOnChange(Widget Function(T value) callback) {
    return _OnFieldChangeBuilder<T>(callback, this);
  }

  static Field<bool> asBool() => _FieldBool();

  static Field<String> asText({String initialValue = ''}) =>
      _FieldText(initialValue);

  static Field<double> asDouble() => _FieldDouble();

  static Field<int> asInt() => _FieldInt();

  static Field<T> as<T>() => _Field<T>();
}

class _Field<T> implements Field<T> {
  T value;
  List<Func<T>> _callbacks = [];

  @override
  T getValue() => value;

  @override
  void setValue(T value) {
    this.value = value;
    _callbacks.forEach((callback) => callback(value));
  }

  @override
  Widget _buildOnChange(Widget Function(T value) callback) =>
      _OnFieldChangeBuilder<T>(callback, this);

  @override
  TextEditingController get controller => null;

  @override
  void dispose() => _callbacks = null;

  @override
  void onChange(Func<T> callback) => _callbacks.add(callback);
}

class _FieldInt extends Field<int> {
  _FieldInt() : super(initialValue: 0);

  @override
  int getValue() => int.parse(controller.text);
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
  final Widget Function(T value) callback;
  final Field<T> field;

  _OnFieldChangeBuilder(this.callback, this.field);

  @override
  __OnFieldChangeBuilderState createState() => __OnFieldChangeBuilderState<T>();
}

class __OnFieldChangeBuilderState<T> extends State<_OnFieldChangeBuilder<T>> {
  @override
  void initState() {
    super.initState();
    widget.field.onChange((data) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) =>
      widget.callback(widget.field.getValue()) ?? Container();
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
      var result = field._buildOnChange(builder);
      if (result != null) {
        return result;
      }
    }

    if (buildByState != null) {
      var result = field._buildOnChange((value) => buildByState[value]);
      if (result != null) {
        return result;
      }
    }

    return Container();
  }
}

class UnableToBuildError extends Error {
  UnableToBuildError();

  @override
  String toString() => 'Unable to build with the provided builders.';
}

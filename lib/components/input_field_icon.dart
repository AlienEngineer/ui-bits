import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputFieldIcon extends StatelessWidget {
  final IconData iconData;

  const InputFieldIcon(this.iconData);

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: 20,
      color: Theme.of(context).hintColor,
    );
  }
}

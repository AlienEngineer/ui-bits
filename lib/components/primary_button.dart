import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const PrimaryButton({
    this.label,
    this.onTap,
  });

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  var _width = 0.0;
  var _height = 0.0;

  double _getTextWidget(BuildContext context) {
    final theme = Theme.of(context);
    final fontSize = theme.textTheme.button.fontSize;
    final renderParagraph = RenderParagraph(
      TextSpan(
        text: widget.label,
        style: TextStyle(
          fontSize: fontSize,
          color: theme.textTheme.button.color,
          fontWeight: theme.textTheme.button.fontWeight,
          letterSpacing: theme.textTheme.button.letterSpacing,
        ),
      ),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );

    renderParagraph.layout(BoxConstraints(minWidth: 120.0));

    return renderParagraph.getMinIntrinsicWidth(fontSize).ceilToDouble() + 45.0;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(),
      () {
        setState(() {
          _width = _getTextWidget(context) + 20;
          _height = 40.0;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonTheme = theme.floatingActionButtonTheme;

    return GestureDetector(
      onTap: widget.onTap,
      child: Material(
        shape: buttonTheme.shape,
        color: theme.primaryColor,
        shadowColor: buttonTheme.backgroundColor ?? theme.primaryColor,
        elevation: buttonTheme.elevation ?? 0.1,
        child: Container(
          width: _width,
          height: _height,
          alignment: Alignment.center,
          child: Text(
            widget.label,
            style: theme.textTheme.button,
          ),
        ),
      ),
    );
  }
}

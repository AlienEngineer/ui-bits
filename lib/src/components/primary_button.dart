import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_bits/src/ui_bits_internal.dart';

class BitPrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final BitAnimation animation;

  const BitPrimaryButton({
    this.label,
    this.onTap,
    this.animation = const BitNoAnimation(),
  });

  @override
  _BitPrimaryButtonState createState() => _BitPrimaryButtonState();
}

class _BitPrimaryButtonState extends State<BitPrimaryButton> {
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

    return widget.animation.wrapWidget(
      child: Material(
        shape: buttonTheme.shape,
        color: theme.primaryColor,
        shadowColor: buttonTheme.backgroundColor ?? theme.primaryColor,
        elevation: buttonTheme.elevation ?? 0.1,
        child: InkWell(
          borderRadius: context.borders.circular,
          onTap: widget.onTap,
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
      ),
    );
  }
}

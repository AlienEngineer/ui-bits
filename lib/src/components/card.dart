import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_bits/ui_bits.dart';

class BitCard extends StatelessWidget {
  final List<Widget> children;
  final double width;
  final double height;
  final BitAnimation animation;
  final BitEdgeInsets padding;

  BitCard({
    this.width,
    this.height,
    this.children,
    this.padding = BitEdgeInsetsOptions.all,
    this.animation = const BitNoAnimation(),
  });

  @override
  Widget build(BuildContext context) {
    return animation.wrapWidget(
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.sizes.medium),
          border: context.borders.round,
        ),
        padding: padding.getEdgeInsets(context.sizes.mediumSmall),
        child: CardSize(
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}

class CardSize extends InheritedWidget {
  final double width;
  final double height;

  CardSize({
    this.width,
    this.height,
    Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static CardSize of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CardSize>();

  double calculateWidth(BuildContext context) =>
      width - context.sizes.mediumSmall * 2;
}

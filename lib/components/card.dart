import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_bits/ui_bits.dart';

class BitCard extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  BitCard({
    this.child,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.sizes.medium),
        border: context.borders.round,
      ),
      padding: EdgeInsets.all(context.sizes.mediumSmall),
      child: child,
    );
  }
}

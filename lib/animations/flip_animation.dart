import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_bits/animations/animations.dart';

class Matrix {
  /// Perspective makes objects that are farther away appear smaller
  ///
  /// the [weight] parameter increases and decreases the amount of perspective,
  /// something like zooming in and out with a zoom lens on a camera. The bigger
  /// this number, the more pronounced is the perspective, which makes it look
  /// like you are closer to the viewed object
  ///
  /// https://medium.com/flutter/perspective-on-flutter-6f832f4d912e
  static Matrix4 perspective([double weight = .001]) =>
      Matrix4.identity()..setEntry(3, 2, weight);
}

class FlipAnimation extends StatefulWidget {
  final Widget child;
  final AnimationStarter onComplete;
  final AnimationRegistry startAfter;
  final Duration duration;

  const FlipAnimation({
    this.child,
    this.onComplete,
    this.startAfter,
    this.duration = const Duration(milliseconds: 700),
  });

  @override
  _FlipAnimationState createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> _flipAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: AnimationOrchestrator.of(context).apply(widget.duration),
    );

    _flipAnimation = Tween<double>(begin: pi / 2.0, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutCubic,
        reverseCurve: Curves.easeIn,
      ),
    );

    widget.startAfter.register(() {
      controller
        ..value = 0.0
        ..forward();
      widget.onComplete.startAnimations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _flipAnimation,
      builder: (context, child) => Transform(
        transform: Matrix.perspective(.001)..rotateX(_flipAnimation.value),
        alignment: Alignment.center,
        child: child,
      ),
      child: widget.child,
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:ui_bits/animations/animations.dart';

class ScaleAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final AnimationRegistry animateAfter;

  const ScaleAnimation({
    this.child,
    this.duration = const Duration(milliseconds: 1150),
    this.curve = Curves.linearToEaseOut,
    this.animateAfter = const StubRegistry(),
  });

  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: AnimationOrchestrator.of(context).apply(widget.duration),
    );
    widget.animateAfter.register(() {
      animationController
        ..value = 0.0
        ..forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animationController,
        curve: widget.curve,
      ),
      child: widget.child,
    );
  }
}

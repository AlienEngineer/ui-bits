import 'package:flutter/widgets.dart';
import 'package:ui_bits/animations/internal_animations.dart';
import 'package:ui_bits/ui_bits.dart';

class BitScaleAnimation extends BitAnimation {
  final AnimationRegistry animateAfter;

  BitScaleAnimation({
    this.animateAfter,
  });

  @override
  Widget wrapWidget({Widget child}) {
    return Builder(builder: (context) {
      return BitScaleAnimationWidget(
        child: child,
        animateAfter: animateAfter,
        duration: context.animation.long,
      );
    });
  }
}

class BitScaleAnimationWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final AnimationRegistry animateAfter;

  const BitScaleAnimationWidget({
    this.child,
    this.duration = const Duration(milliseconds: 1150),
    this.curve = Curves.linearToEaseOut,
    this.animateAfter = const StubRegistry(),
  });

  @override
  _BitScaleAnimationWidgetState createState() =>
      _BitScaleAnimationWidgetState();
}

class _BitScaleAnimationWidgetState extends State<BitScaleAnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
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

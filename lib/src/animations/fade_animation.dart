import 'package:flutter/widgets.dart';
import 'package:ui_bits/src/ui_bits_internal.dart';

class BitFadeInAnimation extends BitAnimation {
  final AnimationRegistry animateAfter;

  BitFadeInAnimation({
    this.animateAfter,
  });

  @override
  Widget wrapWidget({Widget child}) {
    return Builder(builder: (context) {
      return BitFadeInAnimationWidget(
        child: child,
        animateAfter: animateAfter,
        duration: context.animation.extraShort,
      );
    });
  }
}

class BitFadeInAnimationWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final AnimationRegistry animateAfter;

  const BitFadeInAnimationWidget({
    this.child,
    this.duration = const Duration(milliseconds: 150),
    this.animateAfter = const StubRegistry(),
  });

  @override
  _BitFadeInAnimationWidgetState createState() =>
      _BitFadeInAnimationWidgetState();
}

class _BitFadeInAnimationWidgetState extends State<BitFadeInAnimationWidget> {
  var opacity = 0.0;

  @override
  void initState() {
    super.initState();

    widget.animateAfter.register(() {
      setState(() => opacity = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: widget.duration,
      child: widget.child,
      curve: Curves.easeIn,
    );
  }
}

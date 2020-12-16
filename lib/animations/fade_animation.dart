import 'package:flutter/widgets.dart';

import 'animations_orchestrator.dart';

class BitFadeInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final AnimationRegistry animateAfter;

  const BitFadeInAnimation({
    this.child,
    this.duration = const Duration(milliseconds: 150),
    this.animateAfter = const StubRegistry(),
  });

  @override
  _BitFadeInAnimationState createState() => _BitFadeInAnimationState();
}

class _BitFadeInAnimationState extends State<BitFadeInAnimation> {
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

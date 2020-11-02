import 'package:flutter/widgets.dart';
import 'animations_orchestrator.dart';

class FadeInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final AnimationRegistry animateAfter;

  const FadeInAnimation({
    this.child,
    this.duration = const Duration(milliseconds: 150),
    this.animateAfter = const StubRegistry(),
  });

  @override
  _FadeInAnimationState createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> {
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
      duration: AnimationOrchestrator.of(context).apply(widget.duration),
      child: widget.child,
      curve: Curves.easeIn,
    );
  }
}

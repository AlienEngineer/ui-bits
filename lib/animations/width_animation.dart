import 'package:flutter/widgets.dart';
import 'animations_orchestrator.dart';

class TimeInterval {
  final double begin;
  final double end;

  const TimeInterval.first()
      : begin = 0.0,
        end = 1.0;
  const TimeInterval.second()
      : begin = 0.1,
        end = 1.0;

  Interval toInterval(Curve curve) {
    final from = Interval(0.0, 1.0);

    return Interval(
      from.begin + (from.end - from.begin) * begin,
      from.begin + (from.end - from.begin) * end,
      curve: curve,
    );
  }
}

class WidthAnimation extends StatefulWidget {
  final TimeInterval interval;
  final Widget child;
  final double width;
  final double startWidth;
  final Curve curve;
  final Duration duration;
  final AnimationRegistry animateAfter;

  const WidthAnimation({
    this.child,
    this.width,
    this.interval = const TimeInterval.first(),
    this.curve = Curves.linearToEaseOut,
    this.duration = const Duration(milliseconds: 1150),
    this.startWidth = 48.0,
    this.animateAfter = const StubRegistry(),
  });

  @override
  _WidthAnimationState createState() => _WidthAnimationState();
}

class _WidthAnimationState extends State<WidthAnimation> {
  var targetWidget = 0.0;

  @override
  void initState() {
    super.initState();
    targetWidget = widget.startWidth;
    widget.animateAfter.register(() {
      setState(() => targetWidget = widget.width);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: targetWidget,
      duration: AnimationOrchestrator.of(context).apply(widget.duration),
      curve: widget.interval.toInterval(widget.curve),
      child: widget.child,
    );
  }
}

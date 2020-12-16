import 'package:ui_bits/animations/internal_animations.dart';

class BitAnimations {
  static BitAnimation none() => const BitNoAnimation();

  static BitAnimation width({AnimationRegistry animateAfter}) =>
      BitWidthAnimation(animateAfter: animateAfter);

  static BitAnimation scale({AnimationRegistry animateAfter}) =>
      BitScaleAnimation(animateAfter: animateAfter);

  static BitAnimation flip({
    AnimationRegistry animateAfter = const StubRegistry(),
    AnimationStarter onComplete,
  }) =>
      BitFlipAnimation(
        animateAfter: animateAfter,
        onComplete: onComplete,
      );
}
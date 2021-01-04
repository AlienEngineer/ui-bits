import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:ui_bits/ui_bits.dart';

class BitLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Loading(
      indicator: BallPulseIndicator(),
      size: 100.0,
      color: context.theme.primaryColor,
    );
  }
}

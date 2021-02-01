import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_bits/ui_bits.dart';

class LoginPageSample extends StatefulWidget {
  @override
  _LoginPageSampleState createState() => _LoginPageSampleState();
}

class _LoginPageSampleState extends State<LoginPageSample> {
  final AnimationOrchestrator loginCardInputs = AnimationOrchestrator();
  final AnimationOrchestrator flipAnimation = AnimationOrchestrator();

  @override
  initState() {
    super.initState();
    flipAnimation.startAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginCard(
          triggerFlip: flipAnimation.delayedInMillis(300),
          triggerInput: loginCardInputs,
          onTap: () {
            print('tapped');
          },
        ),
      ],
    );
  }

  void _showDialog({String message = "tapped"}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }
}

class LoginCard extends StatelessWidget {
  final VoidCallback onTap;
  final AnimationOrchestrator triggerInput;
  final AnimationRegistry triggerFlip;

  const LoginCard({
    this.onTap,
    this.triggerInput,
    this.triggerFlip = const StubRegistry(),
  });

  @override
  Widget build(BuildContext context) {
    final _CredentialsFields fields = _CredentialsFields();
    final deviceSize = MediaQuery.of(context).size;
    final cardWidth = min(deviceSize.width * 0.75, 360.0);

    return BitCard(
      animation: BitAnimations.flip(
        onComplete: triggerInput,
        animateAfter: triggerFlip,
      ),
      width: cardWidth,
      children: [
        BitInputTextField(
          const FieldLabels(
            label: 'User',
            icon: FontAwesomeIcons.solidUserCircle,
          ),
          field: fields.user,
          animation: BitAnimations.width(animateAfter: triggerInput),
        ),
        SizedBox(height: context.sizes.small),
        BitInputPasswordField(
          const FieldLabels(
            label: 'Password',
            icon: FontAwesomeIcons.lock,
          ),
          field: fields.password,
          animation: BitAnimations.width(
            animateAfter: triggerInput.delayedExtraShort(context),
          ),
        ),
        SizedBox(height: context.sizes.small),
        Center(
          child: BitPrimaryButton(
            onTap: onTap,
            label: 'LOGIN',
            animation: BitAnimations.scale(
              animateAfter: triggerInput.delayedShort(context),
            ),
          ),
        ),
      ],
    );
  }
}

class _CredentialsFields {
  final Field<String> user = Field.asText();
  final Field<String> password = Field.asText();

  void dispose() {
    user.dispose();
    password.dispose();
  }
}

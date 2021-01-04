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
          onTap: () => _showDialog(),
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

class LoginCardLabels {
  final String loginLabel;
  final FieldLabels userField;
  final FieldLabels passwordField;

  const LoginCardLabels({
    this.userField = const FieldLabels(
      label: 'User',
      icon: FontAwesomeIcons.solidUserCircle,
    ),
    this.passwordField = const FieldLabels(
      label: 'Password',
      icon: FontAwesomeIcons.lock,
    ),
    this.loginLabel = 'LOGIN',
  });
}

class LoginCard extends StatelessWidget {
  final VoidCallback onTap;
  final LoginCardLabels messages;
  final AnimationOrchestrator triggerInput;
  final AnimationRegistry triggerFlip;

  const LoginCard({
    this.onTap,
    this.triggerInput,
    this.messages = const LoginCardLabels(),
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
          messages.userField,
          field: fields.user,
          animation: BitAnimations.width(animateAfter: triggerInput),
        ),
        SizedBox(height: context.sizes.small),
        BitInputPasswordField(
          messages.passwordField,
          field: fields.password,
          animation: BitAnimations.width(
            animateAfter: triggerInput.delayedExtraShort(context),
          ),
        ),
        SizedBox(height: context.sizes.small),
        Center(
          child: BitPrimaryButton(
            onTap: onTap,
            label: messages.loginLabel,
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
  final Field<String> user = Field<String>();
  final Field<String> password = Field<String>();

  void dispose() {
    user.dispose();
    password.dispose();
  }

  void print() {
    user.printValues();
    password.printValues();
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_bits/ui_bits.dart';

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
  final AnimationRegistry startInputAnimationsAfter;

  const LoginCard({
    this.onTap,
    this.messages = const LoginCardLabels(),
    this.startInputAnimationsAfter = const StubRegistry(),
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final cardWidth = min(deviceSize.width * 0.75, 360.0);
    const cardPadding = 16.0;
    final textFieldWidth = cardWidth - cardPadding * 2;

    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          width: 1.2,
          color: context.theme.primaryColor,
        ),
      ),
      padding: EdgeInsets.only(
        left: cardPadding,
        right: cardPadding,
        bottom: cardPadding,
        top: cardPadding + 10,
      ),
      width: cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          WidthAnimation(
            duration: const Duration(milliseconds: 1150),
            animateAfter: startInputAnimationsAfter,
            width: textFieldWidth,
            child: TextInputField(messages.userField),
          ),
          SizedBox(height: 10),
          WidthAnimation(
            duration: const Duration(milliseconds: 1150),
            animateAfter: startInputAnimationsAfter.delayedInMillis(150),
            width: textFieldWidth,
            child: PasswordInputField(
              messages.passwordField,
              animateAfter: startInputAnimationsAfter.delayedInMillis(300),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ScaleAnimation(
              duration: const Duration(milliseconds: 1150),
              animateAfter: startInputAnimationsAfter,
              child: PrimaryButton(
                onTap: onTap,
                label: messages.loginLabel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalog',
      theme: PurpleThemeFactory().makeTheme(),
      home: Catalog(title: 'Flutter Components Catalog'),
    );
  }
}

class Catalog extends StatefulWidget {
  Catalog({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  final AnimationOrchestrator loginCardInputs = AnimationOrchestrator();
  final AnimationOrchestrator flipAnimation = AnimationOrchestrator();

  @override
  void initState() {
    super.initState();

    flipAnimation.startAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(25.0),
              child: FlipAnimation(
                duration: const Duration(milliseconds: 700),
                onComplete: loginCardInputs,
                startAfter: flipAnimation.delayedInMillis(150),
                child: LoginCard(
                  startInputAnimationsAfter:
                      loginCardInputs.delayedInMillis(500),
                  onTap: () => _showDialog(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog({String message = "tapped"}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
        );
      },
    );
  }
}

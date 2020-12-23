import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_bits/ui_bits.dart';

import 'carousel_page_sample.dart';
import 'login_page_sample.dart';
import 'typography_page_sample.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    var themeFactory = ThemeFactory();

    return MaterialApp(
      title: 'Catalog',
      theme: themeFactory.makeBlueTheme(),
      home: themeFactory.makeHome(
        child: Catalog(title: 'Flutter Components Catalog'),
      ),
    );
  }
}

class Catalog extends StatefulWidget {
  final String title;

  Catalog({Key key, this.title}) : super(key: key);
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  Widget currentWidget;

  @override
  void initState() {
    currentWidget = LoginPageSample();
    super.initState();
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
              child: currentWidget,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: context.theme.primaryColor,
              ),
            ),
            buildTile('Login Card', LoginPageSample()),
            buildTile('Carousel Cards', CarouselPageSample()),
            buildTile('Typography', TypographyPageSample()),
          ],
        ),
      ),
    );
  }

  ListTile buildTile(String data, Widget widget) {
    return ListTile(
      title: Text(data),
      onTap: () {
        setState(() {
          currentWidget = widget;
        });
        Navigator.pop(context);
      },
    );
  }
}

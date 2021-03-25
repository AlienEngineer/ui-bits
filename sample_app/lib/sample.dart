import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ui_bits/ui_bits.dart';

import 'carousel_page_sample.dart';
import 'loading_page_sample.dart';
import 'login_page_sample.dart';
import 'pin_pad_page_sample.dart';
import 'typography_page_sample.dart';
import 'date_picker_page_sample.dart';
import 'inputs_page_sample.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Builder(
        builder: (context) {
          return Consumer<ThemeProvider>(builder: (_, provider, ___) {
            return MaterialApp(
              title: 'Catalog',
              theme: provider.theme,
              home: provider.themeFactory.makeHome(
                child: Builder(
                  builder: (context) {
                    var shortestSide = MediaQuery.of(context).size.shortestSide;

                    if (shortestSide > 600) {
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.landscapeRight,
                        DeviceOrientation.landscapeLeft,
                      ]);
                    } else {
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.portraitUp,
                        DeviceOrientation.portraitDown,
                      ]);
                    }

                    return Catalog(title: 'ui-bits Components Catalog');
                  },
                ),
              ),
            );
          });
        },
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  var themeFactory = ThemeFactory();
  ThemeData theme;
  List<ThemeData> themes;
  int current = 0;

  ThemeProvider() {
    theme = themeFactory.makeBlueTheme();
    themes = [
      themeFactory.makeBlueTheme(),
      themeFactory.makePurpleTheme(),
    ];
  }

  void changeTheme() {
    current = (++current % themes.length);
    theme = themes[current];
    notifyListeners();
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
    currentWidget = DatePickerPageSample();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                context.read<ThemeProvider>().changeTheme();
              },
              child: Icon(
                Icons.color_lens_outlined,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(25.0),
        child: Center(child: currentWidget),
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
            buildTile('Loading', LoadingPageSample()),
            buildTile('PinPad', PinPadPageSample()),
            buildTile('DatePicker', DatePickerPageSample()),
            buildTile('inputs', InputsPageSample()),
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

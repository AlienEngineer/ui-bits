# ui_bits

![Flutter](https://github.com/AlienEngineer/ui-bits/workflows/Flutter/badge.svg)

A UI components(bits) library

## Getting Started

### Register Theme:

```dart
    var themeFactory = ThemeFactory();

    return MaterialApp(
      title: 'Catalog',
      theme: themeFactory.makeBlueTheme(),
      home: themeFactory.makeHome(
        child: Catalog(title: 'Flutter Components Catalog'),
      ),
    );
```


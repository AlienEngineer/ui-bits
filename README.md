# ui_bits

![Flutter](https://github.com/AlienEngineer/ui-bits/workflows/Flutter/badge.svg)

A UI components(bits) library

## Getting Started

### Register Theme

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

### Paddings

```dart

    // Small uses BitSizes.small from theme, default: 10.0 
    BitSmallPadding(
      options: BitEdgeInsetsOptions.top,
      child: Text('some text'),
    );

```

#### Options

top: `BitEdgeInsetsOptions.top`

bottom: `BitEdgeInsetsOptions.bottom`

left: `BitEdgeInsetsOptions.left`

right: `BitEdgeInsetsOptions.right`

all: `BitEdgeInsetsOptions.all`

none: `BitEdgeInsetsOptions.none`

combine:
```dart
    // sums the given insets, in this case left and right.
    BitEdgeInsetsOptions.combine([
        BitEdgeInsetsOptions.left,
        BitEdgeInsetsOptions.right,
    ]);
```

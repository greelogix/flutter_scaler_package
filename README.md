# FlutterAdaptiveScaler

[![pub package](https://img.shields.io/pub/v/flutter_adaptive_scaler.svg)](https://pub.dev/packages/flutter_adaptive_scaler)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A Flutter package for fully responsive apps. Automatically scales fonts, sizes, padding, icons, radius, lists, grids, and all UI elements for every screen, device, orientation, and web/desktop window resize.

## Features

- **🚀 Instant Scaling**: Scales everything based on your design reference size.
- **📱 Universal Support**: Works seamlessly on Mobile, Tablet, iPad, Web, and Desktop.
- **🔄 Real-time Updates**: Automatically recalculates on orientation changes and window resizing.
- **🧩 Simple Extensions**: Use `.w`, `.h`, `.sp`, `.r`, `.i`, and `.p` on any number.
- **⚡ Proactive Rebuilding**: `FlutterScaler` wrapper with `builder` pattern for full reactivity.

## Getting Started

Add `flutter_scaler` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_scaler: ^0.0.1
```

## Usage

Wrap your `MaterialApp` with `FlutterScaler`. Using the `builder` pattern is recommended to ensure that everything updates correctly when the screen size changes:

```dart
import 'package:flutter_scaler/flutter_scaler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterScaler(
      baseWidth: 375, // Your design width (default: 375)
      baseHeight: 812, // Your design height (default: 812)
      builder: (context, child) => MaterialApp(
        title: 'My Scaled App',
        home: MyHomePage(),
      ),
    );
  }
}
```

### Responsive Extensions

Apply scaling to any number by simply adding an extension:

- `200.w`: Scale width
- `100.h`: Scale height
- `16.sp`: Scale font size
- `8.r`: Scale border radius
- `24.i`: Scale icon size
- `12.p`: Scale padding/margin

```dart
Container(
  width: 200.w,
  height: 100.h,
  padding: EdgeInsets.all(12.p),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8.r),
    color: Colors.blue,
  ),
  child: Column(
    children: [
      Icon(Icons.star, size: 24.i),
      Text('Hello Responsive!', style: TextStyle(fontSize: 16.sp)),
    ],
  ),
)
```

## Scaling Logic

The package calculates scale factors dynamically:

1. `scaleWidth = currentWidth / baseWidth`
2. `scaleHeight = currentHeight / baseHeight`
3. `scaleText = min(scaleWidth, scaleHeight)`

The `min` logic ensures that your text and icons never overflow even if the screen's aspect ratio differs dramatically from your design reference.

## Example

Check out the full professional dashboard example in the [example](https://github.com/musawarhussain/flutter_scaler/tree/main/example) folder.

## Author

Created by **GreeLogix**.

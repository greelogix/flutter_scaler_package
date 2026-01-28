import 'dart:math';
import 'package:flutter/widgets.dart';

/// A configuration class for managing scaling factors and screen dimensions.
///
/// This class stores the base design dimensions and provides the current
/// scaling factors for width, height, and text based on the screen size.
class ScalerConfig {
  static final ScalerConfig _instance = ScalerConfig._internal();
  factory ScalerConfig() => _instance;
  ScalerConfig._internal();

  static late double _baseWidth;
  static late double _baseHeight;
  static late double _currentWidth;
  static late double _currentHeight;

  /// The horizontal scale factor (currentWidth / baseWidth).
  static double get scaleWidth => _currentWidth / _baseWidth;

  /// The vertical scale factor (currentHeight / baseHeight).
  static double get scaleHeight => _currentHeight / _baseHeight;

  /// The text scale factor, which uses the minimum of [scaleWidth] and [scaleHeight].
  /// This ensures that text scales proportionally without overflowing on one dimension.
  static double get scaleText => min(scaleWidth, scaleHeight);

  /// Initializes the scaler with base dimensions and the current screen size.
  ///
  /// [baseWidth] and [baseHeight] are usually the dimensions from your design (e.g., 375x812).
  /// [currentSize] is the actual size of the device screen or window.
  static void init({
    required double baseWidth,
    required double baseHeight,
    required Size currentSize,
  }) {
    _baseWidth = baseWidth;
    _baseHeight = baseHeight;
    _currentWidth = currentSize.width;
    _currentHeight = currentSize.height;
  }

  /// Updates the current screen dimensions.
  ///
  /// This is called when the device orientation changes or the window is resized.
  static void updateSize(Size size) {
    _currentWidth = size.width;
    _currentHeight = size.height;
  }

  /// Returns the current screen width.
  static double get currentWidth => _currentWidth;

  /// Returns the current screen height.
  static double get currentHeight => _currentHeight;
}

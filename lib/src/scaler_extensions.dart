import 'scaler_config.dart';

/// Extension on [num] to provide easy scaling methods for building responsive UIs.
///
/// These extensions allow you to define dimensions in terms of the base design size
/// and automatically scale them according to the actual screen dimensions.
extension ScalerExtensions on num {
  /// Scaled width based on the current screen width relative to the base design width.
  ///
  /// Example: `width: 200.w`
  double get w => this * ScalerConfig.scaleWidth;

  /// Scaled height based on the current screen height relative to the base design height.
  ///
  /// Example: `height: 100.h`
  double get h => this * ScalerConfig.scaleHeight;

  /// Scaled font size based on the minimum of width and height scale factors.
  ///
  /// Using the minimum ensures that text doesn't overflow when one dimension is smaller.
  /// Example: `fontSize: 16.sp`
  double get sp => this * ScalerConfig.scaleText;

  /// Scaled radius for border radius. Uses the same logic as [sp].
  ///
  /// Example: `borderRadius: BorderRadius.circular(8.r)`
  double get r => this * ScalerConfig.scaleText;

  /// Scaled icon size. Uses the same logic as [sp].
  ///
  /// Example: `Icon(Icons.add, size: 24.i)`
  double get i => this * ScalerConfig.scaleText;

  /// Scaled padding or margin. Uses the same logic as [sp].
  ///
  /// Example: `padding: EdgeInsets.all(12.p)`
  double get p => this * ScalerConfig.scaleText;
}

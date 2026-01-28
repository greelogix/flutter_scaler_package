import 'package:flutter/widgets.dart';
import 'scaler_config.dart';

/// A wrapper widget that provides responsive scaling for the entire application.
///
/// This widget uses [MediaQuery] to detect changes in screen dimensions (like
/// window resizing on web/desktop or device orientation changes) and automatically
/// recalculates scaling factors.
///
/// Using the [builder] pattern is recommended to ensure that the entire widget tree
/// below the [MaterialApp] is rebuilt with the correct scale factors whenever
/// the screen size changes.
class FlutterScaler extends StatelessWidget {
  /// A builder function that returns the child widget tree.
  ///
  /// This is the preferred way to use [FlutterScaler] as it ensures that the
  /// [BuildContext] used within the app has access to the updated scale factors.
  final Widget Function(BuildContext, Widget?)? builder;

  /// An optional child widget. Used if [builder] is not provided.
  final Widget? child;

  /// The horizontal dimension of your design reference (e.g., in Figma or XD).
  /// Defaults to 375.
  final double baseWidth;

  /// The vertical dimension of your design reference (e.g., in Figma or XD).
  /// Defaults to 812.
  final double baseHeight;

  /// Creates a [FlutterScaler] widget.
  ///
  /// You must provide either a [builder] or a [child].
  const FlutterScaler({
    super.key,
    this.builder,
    this.child,
    this.baseWidth = 375,
    this.baseHeight = 812,
  }) : assert(builder != null || child != null, 'Either builder or child must be provided');

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context) ensures this widget rebuilds whenever the screen size or orientation changes.
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;

    ScalerConfig.init(
      baseWidth: baseWidth,
      baseHeight: baseHeight,
      currentSize: size,
    );

    if (builder != null) {
      return builder!(context, child);
    }

    return child!;
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_adaptive_scaler/flutter_adaptive_scaler.dart';

void main() {
  test('ScalerConfig initialization and scaling factors', () {
    ScalerConfig.init(
      baseWidth: 375,
      baseHeight: 812,
      currentSize: const Size(750, 1624), // 2x scale
    );

    expect(ScalerConfig.scaleWidth, 2.0);
    expect(ScalerConfig.scaleHeight, 2.0);
    expect(ScalerConfig.scaleText, 2.0);

    expect(10.w, 20.0);
    expect(10.h, 20.0);
    expect(10.sp, 20.0);
    expect(10.r, 20.0);
  });

  test('ScalerConfig min scaling (text scaling)', () {
    ScalerConfig.init(
      baseWidth: 375,
      baseHeight: 812,
      currentSize: const Size(750, 812), // 2x width, 1x height
    );

    expect(ScalerConfig.scaleWidth, 2.0);
    expect(ScalerConfig.scaleHeight, 1.0);
    expect(ScalerConfig.scaleText, 1.0); // min(2, 1)

    expect(10.w, 20.0);
    expect(10.h, 10.0);
    expect(10.sp, 10.0);
  });
}

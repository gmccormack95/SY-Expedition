import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:sy_expedition/util/app_colors.dart';

class MapImage extends StatelessWidget {
  MapImage({ this.mapAnimation });

  final double mapAnimation;

  @override
  Widget build(BuildContext context) {
    double scale = 1 + 0.3 * (1 - mapAnimation);

    return ColorFiltered(
      colorFilter: ColorFilter.mode(AppColors.map_filter, BlendMode.modulate),
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(scale, scale)..rotateZ(0.05 * math.pi * (1 - mapAnimation)),
          child: Opacity(
            opacity: mapAnimation,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/map.png',
                fit: BoxFit.cover,
              )
          ),
        )
      ),
    );
  }
}
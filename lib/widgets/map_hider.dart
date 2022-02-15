import 'package:flutter/material.dart';

class MapHider extends StatelessWidget {
  MapHider({ this.mapAnimation : 0, this.child });

  final double mapAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    double opacity = 1 - (mapAnimation * 4);
    if(opacity > 1) opacity = 1;
    if(opacity < 0) opacity = 0;

    return Opacity(
      opacity:opacity,
      child: child,
    );
  }
}
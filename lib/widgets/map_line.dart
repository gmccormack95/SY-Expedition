import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sy_expedition/util/app_colors.dart';

class MapLine extends StatelessWidget {
  MapLine({this.pageValue, this.expandAnimation, this.isExpanded});

  final double pageValue;
  final double expandAnimation;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    double marginFactor;

    if (isExpanded) {
      marginFactor = Curves.fastOutSlowIn.transform(
        max(0, 1 - expandAnimation * 3.0),
      );
      if (marginFactor > 1.0) marginFactor = 1.0;
    } else {
      marginFactor = Curves.easeInExpo.transform(
        max(0, pageValue),
      );
    }

    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 10.0,
            width: 10.0,
            margin: EdgeInsets.only(left: 40.0 * marginFactor),
            decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          ),
          Container(
            height: 4.0,
            width: 4.0,
            margin: EdgeInsets.only(left: 10.0 * marginFactor),
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          ),
          Container(
            height: 4.0,
            width: 4.0,
            margin: EdgeInsets.only(right: 10.0 * marginFactor),
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          ),
          Container(
            height: 10.0,
            width: 10.0,
            margin: EdgeInsets.only(right: 40.0 * marginFactor),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: AppColors.primary_black,
              shape: BoxShape.circle
            ),
          ),
        ],
      ),
    );
  }
}

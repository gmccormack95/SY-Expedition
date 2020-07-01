import 'dart:math';

import 'package:flutter/material.dart';

class MapLine extends StatelessWidget {
  MapLine({
    this.pageValue
  });

  final double pageValue;
  @override
  Widget build(BuildContext context) {
    double marginFactor = Curves.easeInExpo.transform(
      max(
        0,
        pageValue
      ),
    );

    return Container(
      height: 40.0,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 10.0,
            width: 10.0,
            margin: EdgeInsets.only(right: 40.0 * marginFactor),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white
              ),
              shape: BoxShape.circle
            ),
          ),
          Container(
            height: 4.0,
            width: 4.0,
            margin: EdgeInsets.only(right: 10.0 * marginFactor),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
          ),
          Container(
            height: 4.0,
            width: 4.0,
            margin: EdgeInsets.only(left: 10.0 * marginFactor),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
          ),
          Container(
            height: 10.0,
            width: 10.0,
            margin: EdgeInsets.only(left: 40.0 * marginFactor),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
          ),
        ],
      ),
    );
  }
}
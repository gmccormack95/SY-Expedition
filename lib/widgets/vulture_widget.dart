import 'package:flutter/material.dart';
import 'package:sy_expedition/util/app_colors.dart';

class VultureWidget extends StatelessWidget {
  VultureWidget({
    this.opacity,
    this.isExpanded,
    this.expandAnimation
  });

  final double opacity;
  final bool isExpanded;
  final double expandAnimation;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      duration: Duration(milliseconds: 750),
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(
        left: width/2, 
        right: width/2, 
        bottom: isExpanded && expandAnimation >= 0.3
          ? height - (height / 4) - 50
          : 120
      ),
      child: Opacity(
        opacity: opacity,
        child: Container(
          height: 50.0,
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          alignment: Alignment.topLeft,
          child: Text(
            'Travel details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
    );
  }
}
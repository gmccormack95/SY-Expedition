import 'package:flutter/material.dart';
import 'package:sy_expedition/util/app_colors.dart';

class VultureWidget extends StatelessWidget {
  VultureWidget({
    this.opacity,
    this.isDown
  });

  final double opacity;
  final bool isDown;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: width/2, right: width/2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Opacity(
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
          Opacity(
            opacity: opacity,
            child: Container(
              height: 120.0,
              padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 50.0),
              child: Text(
                '',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.content_grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 11.0,
                  wordSpacing: 3.0,
                  height: 1.8
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
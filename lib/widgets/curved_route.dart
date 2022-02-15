import 'package:flutter/material.dart';
import 'package:sy_expedition/util/app_colors.dart';

import 'curved_painter.dart';

class CurvedRoute extends StatelessWidget {
  CurvedRoute({ this.mapAnimation });

  final double mapAnimation;

  double startTop(context) => topMargin(context) + mainSquareSize(context) + 32 + 16 + 32 + 4;

  double endTop(context) => topMargin(context) + 32 + 16 + 8;

  double oneThird(context) => (startTop(context) - endTop(context)) / 3;

  double topMargin(BuildContext context) => MediaQuery.of(context).size.height > 700 ? 128 : 64;

  double mainSquareSize(BuildContext context) => MediaQuery.of(context).size.height / 2;

  double dotsTopMargin(BuildContext context) => topMargin(context) + mainSquareSize(context) + 32 + 16 + 32 + 4;

  double bottom(BuildContext context) => MediaQuery.of(context).size.height - dotsTopMargin(context) - 8 - 58;

  @override
  Widget build(BuildContext context) {
    double startTop = topMargin(context) + mainSquareSize(context) + 48;
    double endTop = topMargin(context) + 32 + 28;
    double oneThird = (startTop - endTop) / 3;
    double width = MediaQuery.of(context).size.width;
    EdgeInsets mediaPadding = MediaQuery.of(context).padding;

    return Visibility(
      visible: mapAnimation > 0.18,
      child: Positioned(
        top: endTop,
        bottom: bottom(context) - mediaPadding.vertical,
        left: 0,
        right: 0,
        child: CustomPaint(
          painter: CurvePainter(mapAnimation),
          child: Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Positioned(
                  top: oneThird,
                  right: width / 2 - 4 - mapAnimation * 46,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                      color: AppColors.primary_black,
                    ),
                    height: 10.0,
                    width: 10.0,
                  ),
                ),
                Positioned(
                  top: 2 * oneThird,
                  right: width / 2 - 4 - mapAnimation * 50,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                      color: AppColors.primary_black,
                    ),
                    height: 10.0,
                    width: 10.0,
                  ),
                ),
                Align(
                  alignment: Alignment(0, 1),
                  child: Container(
                    margin: EdgeInsets.only(right: 100 * mapAnimation),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                      color: AppColors.primary_black,
                    ),
                    height: 10.0,
                    width: 10.0,
                  ),
                ),
                Align(
                  alignment: Alignment(0, -1),
                  child: Container(
                    margin: EdgeInsets.only(left: 40 * mapAnimation),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    height: 10.0,
                    width: 10.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
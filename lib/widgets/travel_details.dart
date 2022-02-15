import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:sy_expedition/util/app_colors.dart';
import 'package:sy_expedition/widgets/map_line.dart';

import 'map_hider.dart';

class TravelDetails extends StatelessWidget {
  TravelDetails(
      {this.pageValue,
      this.expandAnimation,
      this.onSwipeUp,
      this.isExpanded: false});

  final double pageValue;
  final Function onSwipeUp;
  final bool isExpanded;
  final double expandAnimation;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        alignment: Alignment.bottomCenter,
        duration: Duration(milliseconds: 750),
        height: isExpanded && expandAnimation >= 0.3
          ? height - (height / 4) 
          : 170.0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildDetails(width), 
            _buildMapDetails(expandAnimation),
          ],
        )
      )
    );
  }

  Widget _buildDetails(double width) {
    return MapHider(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, 
        children: <Widget>[
          GestureDetector(
            onTap: () {
              onSwipeUp();
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              height: 50,
              padding: const EdgeInsets.only(right: 20.0),
              alignment: Alignment.centerRight,
              child: Transform.rotate(
                angle: isExpanded ? math.pi : 0,
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                ),
              )
            ),
          ),
          Expanded(
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                int sensitivity = 4;
                if (details.delta.dy < -sensitivity) {
                  onSwipeUp();
                }
              },
              child: Opacity(
                opacity: Curves.easeInExpo.transform(
                  math.max(0, pageValue),
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 80.0,
                            height: 40.0,
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Start camp',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                          Container(
                            width: 80.0,
                            height: 40.0,
                            alignment: Alignment.centerRight,
                            child: Text(
                              '02:40 pm',
                              style: TextStyle(
                                color: AppColors.content_grey,
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: math.min(width - 160, 140 / pageValue),
                            height: 40.0,
                            child: MapLine(
                              isExpanded: isExpanded,
                              expandAnimation: expandAnimation,
                              pageValue: pageValue,
                            ),
                          ),
                          Container(
                            width: math.min(width - 160, 140 / pageValue),
                            height: 40.0,
                            alignment: Alignment.center,
                            child: Text(
                              '72 km',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 80.0,
                            height: 40.0,
                            margin: EdgeInsets.only(top: 15.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Base camp',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                          Container(
                            width: 80.0,
                            height: 40.0,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '07:30 am',
                              style: TextStyle(
                                color: AppColors.content_grey,
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                )
              )
            ),
          )
      ]),
    );
  }

  Widget _buildMapDetails(double expandAnimation) {
    return IgnorePointer(
      ignoring: true,
      child: Column(
        children: [
          Container(
            height: expandAnimation >= 0.3
              ? 10.0
              : 0.0,
            width: expandAnimation >= 0.3
              ? 10.0
              : 0.0,
            margin: EdgeInsets.only(top: 105.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 1.0,
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 65.0),
              ),
            ),
          ),
        ],
      )
    );
  }
}

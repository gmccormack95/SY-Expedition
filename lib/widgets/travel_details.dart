import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:sy_expedition/util/app_colors.dart';
import 'package:sy_expedition/widgets/map_line.dart';

class TravelDetails extends StatelessWidget {
  TravelDetails({
    this.pageValue,
    this.onTap,
    this.isDown : false
  });
  
  final double pageValue;
  final Function onTap;
  final bool isDown;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget> [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 50,
              padding: const EdgeInsets.only(right: 20.0),
              alignment: Alignment.centerRight,
              child: Transform.rotate(
                angle: isDown
                  ? 0
                  : (math.pi),
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                ),
              )
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: Opacity(
              opacity: Curves.easeInExpo.transform(
                math.max(
                  0,
                  pageValue
                ),
              ),
              child: Container(
                height: 120.0,
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
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
                          width: math.min(
                            width - 160,
                            140 / pageValue
                          ),
                          height: 40.0,
                          child: MapLine(
                            pageValue: pageValue,
                          ),
                        ),
                        Container(
                          width: 80.0,
                          height: 40.0,
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
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
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
                        Container(
                          width: math.min(
                            width - 160,
                            140 / pageValue
                          ),
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
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
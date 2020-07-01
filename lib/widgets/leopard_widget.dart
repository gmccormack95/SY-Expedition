import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sy_expedition/util/app_colors.dart';

class LeopardWidget extends StatelessWidget {
  LeopardWidget({
    this.opacity
  });

  final double opacity; 

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: width/2, right: width/2),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 80.0),
            padding: const EdgeInsets.only(right: 40.0, left: 20.0),
            child: Image.asset('assets/images/72.png')
          ),
          Opacity(
            opacity: opacity,
            child: Container(
              height: 50,
              padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Travel description',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  Container(
                    width: 50.0,
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.transparent,
                      size: 35.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: opacity,
            child: Container(
              height: 120.0,
              padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 50.0),
              child: Text(
                'The leopard is distinguished by its well-camouflaged fur, opportunistic hunting behaviour, broad diet and strength.',
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
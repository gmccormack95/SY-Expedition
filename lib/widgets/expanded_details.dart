import 'package:flutter/material.dart';
import 'package:sy_expedition/util/app_colors.dart';
import 'dart:math' as math;

class ExpandedDetails extends StatelessWidget {
  ExpandedDetails({ this.isExpanded, this.expandAnimation});

  final bool isExpanded;
  final double expandAnimation;

  @override
  Widget build(BuildContext context) {

    return Visibility(
      visible: isExpanded,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 120.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLeopardPoint(),
            _buildVulturePoint()
          ],
        )
      ),
    );
  }

  Widget _buildLeopardPoint() {
    double leopardAnimation = Curves.easeIn.transform(
      math.max(0, expandAnimation),
    );

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: Duration(milliseconds: 450),
            opacity: leopardAnimation > 0.6
              ? 1.0
              : 0.0,
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      child: Image(
                        width: 40.0,
                        image: AssetImage('assets/images/leopards.png'),
                        fit: BoxFit.cover
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      width: 50.0,
                      child: Text(
                        'Leopards',
                        style: TextStyle(
                          color: AppColors.content_grey,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedContainer(
                  width: 25.0,
                  duration: Duration(milliseconds: 450),
                  margin: EdgeInsets.only(
                    right: leopardAnimation > 0.6
                      ? 25
                      : 50,
                    left: 25.0
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '-',
                    style: TextStyle(
                      color: AppColors.content_grey,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: expandAnimation >= 1.0,
              maintainSize: true, 
              maintainAnimation: true,
              maintainState: true,
            child: Container(
              height: 10.0,
              width: 10.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: AppColors.primary_black,
                shape: BoxShape.circle
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 450),
            width: 75.0,
            margin: EdgeInsets.only(
              left: leopardAnimation > 0.6
                ? 25
                : 50,
              right: 25.0
            ),
          )
        ],
      ),
    );
  }

  Widget _buildVulturePoint() {
    double vultureAnimation = Curves.easeIn.transform(
      math.max(0, expandAnimation),
    );

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 450),
            width: 75.0,
            margin: EdgeInsets.only(
              right: vultureAnimation > 0.6
                ? 25
                : 50,
              left: 25.0
            ),
          ),
          Visibility(
            maintainSize: true, 
            maintainAnimation: true,
            maintainState: true,
            visible: expandAnimation > 0.6,
            child: Container(
              height: 10.0,
              width: 10.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: AppColors.primary_black,
                shape: BoxShape.circle
              ),
            ),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 450),
            opacity: vultureAnimation > 0.6
              ? 1.0
              : 0.0,
            child: Row(
              children: [
                AnimatedContainer(
                  width: 25.0,
                  duration: Duration(milliseconds: 450),
                  margin: EdgeInsets.only(
                    left: vultureAnimation > 0.6
                      ? 25
                      : 50,
                    right: 25.0
                  ),
                  alignment: Alignment.centerRight,
                  child: Text(
                    '-',
                    style: TextStyle(
                      color: AppColors.content_grey,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Column(
                  children: [
                    Image(
                      width: 30.0,
                      image: AssetImage('assets/images/vultures.png'),
                      fit: BoxFit.cover
                    ),
                    Container(
                      width: 50.0,
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Vultures',
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
        ],
      ),
    );
  }
}
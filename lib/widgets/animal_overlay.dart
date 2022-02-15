import 'dart:math';

import 'package:flutter/material.dart';

class AnimalOverlay extends StatelessWidget {
  AnimalOverlay({this.pageValue: 0, this.expandAnimation: 0, this.isExpanded});

  final pageValue;
  final double expandAnimation;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    double translate = Curves.easeInOut.transform(
      max(
        0.0,
        ((pageValue ?? 0)).abs(),
      ),
    );
    double size = Curves.easeInExpo.transform(
      max(
        0.0,
        ((pageValue ?? 0)).abs(),
      ),
    );

    double mapSize = Curves.easeInExpo.transform(
      max(
        0.0,
        ((1 - expandAnimation * 0.45 ?? 0)).abs(),
      ),
    );
    if (mapSize > 1.0) mapSize = 1.0;

    double width = MediaQuery.of(context).size.width;

    return Transform(
      transform: Matrix4.translationValues(translate * (-1.0 * width), 0.0, 0.0),
      child: IgnorePointer(
        ignoring: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Container(
            margin: EdgeInsets.only(left: width),
            child: Container(
              child: OverflowBox(
                minWidth: 0.0,
                minHeight: 0.0,
                maxWidth: width * 2,
                maxHeight: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        width: width,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: Transform.scale(
                          alignment: AlignmentDirectional.center,
                          scale: isExpanded 
                          ? mapSize
                          : 2.0 * size,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Color(0xFF5f5f5f),
                                shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 1.0 - (expandAnimation * 0.5),
                      child: Transform.scale(
                        scale: 1.0 - (expandAnimation * 0.15),
                        origin: Offset(200, -150),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Image(
                              image: AssetImage(
                                  'assets/images/leopard_vulture_image.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    )
                  ],
                )
              )
            ),
          ),
        ),
      ),
    );
  }
}

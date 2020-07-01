import 'dart:math';

import 'package:flutter/material.dart';

class AnimalOverlay extends StatelessWidget {
  AnimalOverlay({
    this.pageValue : 0
  });

  final pageValue;

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
                      child:  Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        width: width,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: Transform.scale(
                          alignment: AlignmentDirectional.center,
                          scale: 2.0 * size,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF5f5f5f),
                              shape: BoxShape.circle
                            ),
                          ),
                        ),
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/images/leopard_vulture_image.png'), 
                      fit: BoxFit.cover
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
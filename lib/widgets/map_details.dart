import 'package:flutter/material.dart';
import 'package:sy_expedition/util/app_colors.dart';

class MapDetails extends StatelessWidget {
  MapDetails({this.mapAnimation});

  final double mapAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      opacity: mapAnimation > 0.8
        ? 1.0
        : 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(right: 60, top: 40.0),
            child: Text(
              'Base camp',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
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
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 100.0),
            child: Column(
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
          ),
          Text(
            'Start camp',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }
}
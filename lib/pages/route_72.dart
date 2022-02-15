import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sy_expedition/util/app_colors.dart';
import 'package:sy_expedition/widgets/animal_overlay.dart';
import 'package:sy_expedition/widgets/curved_route.dart';
import 'package:sy_expedition/widgets/expanded_details.dart';
import 'package:sy_expedition/widgets/map_details.dart';
import 'package:sy_expedition/widgets/map_hider.dart';
import 'package:sy_expedition/widgets/map_image.dart';
import 'package:sy_expedition/widgets/small_app_bar.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:sy_expedition/widgets/leopard_widget.dart';
import 'package:sy_expedition/widgets/travel_details.dart';
import 'package:sy_expedition/widgets/vulture_widget.dart';

class Route72 extends StatefulWidget {
  @override
  _Route72State createState() => _Route72State();
}

class _Route72State extends State<Route72> with TickerProviderStateMixin {
  AnimationController expandAnimationController;
  AnimationController mapAnimationController;
  Animation expandAnimation;
  Animation mapAnimation;
  bool isExpanded = false;
  final currentPageNotifier = ValueNotifier<int>(0);
  var currentPageValue = 0.0;
  var pageController = PageController(viewportFraction: 2.0);

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page;
      });
    });

    expandAnimationController = new AnimationController(vsync: this, duration: const Duration(milliseconds: 750));
    mapAnimationController = new AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    expandAnimation = Tween(begin: 0.0, end: 1.0).animate(expandAnimationController);
    expandAnimation..addListener(() {
      setState(() {
        
      });
    });

    mapAnimation = Tween(begin: 0.0, end: 1.0).animate(mapAnimationController);
    mapAnimation..addListener(() {
      setState(() {
        
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    expandAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmallAppBar(),
      body: Container(
        color: AppColors.primary_black,
        child: Stack(
          children: [
            _buildMap(),
            Column(
              children: <Widget>[
                _buildSYHeader(),
                _buildSweepingContent(expandAnimation.value),
                _buildBottomBar(),
              ],
            ),
          ],
        )
      )
    );
  }

  Widget _buildSYHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'SY',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600),
          ),
          Container(
            height: 20.0,
            width: 20.0,
            child: Image.asset('assets/images/menu.png'),
          ),
        ],
      ),
    );
  }

  Widget _buildSweepingContent(double expandAnimation) {
    return Expanded(
      child: Container(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              physics: ClampingScrollPhysics(),
              controller: pageController,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return LeopardWidget(
                      opacity: Curves.easeInExpo.transform(
                    max(
                      0.0,
                      1.0 - ((currentPageValue ?? 0) - (index)).abs(),
                    ),
                  ));
                } else {
                  return MapHider(
                    mapAnimation: mapAnimation.value,
                    child: VultureWidget(
                      opacity: Curves.easeInExpo.transform(
                        max(
                          0.0,
                          1.0 - ((currentPageValue ?? 0) - (index)).abs(),
                        ),
                      ),
                      isExpanded: isExpanded,
                      expandAnimation: expandAnimation,
                    ),
                  );
                }
              },
              onPageChanged: (index) {
                currentPageNotifier.value = index;
              },
            ),
            MapHider(
              mapAnimation: mapAnimation.value,
              child: AnimalOverlay(
                pageValue: currentPageValue,
                expandAnimation: expandAnimation,
                isExpanded: isExpanded,
              ),
            ),
            MapHider(
              mapAnimation: mapAnimation.value,
              child: TravelDetails(
                pageValue: currentPageValue,
                expandAnimation: expandAnimation,
                isExpanded: isExpanded,
                onSwipeUp: () {
                  setState(() {
                    this.isExpanded = !isExpanded;
                    if (isExpanded) {
                      expandAnimationController.forward();
                    } else {
                      expandAnimationController.reverse();
                    }
                  });
                },
              ),
            ),
            MapHider(
              mapAnimation: mapAnimation.value,
              child: ExpandedDetails(
                isExpanded: true,
                expandAnimation: expandAnimation,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return GestureDetector(
        child: Container(
      height: 100.0,
      padding: const EdgeInsets.only(left: 20, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Opacity(
              opacity: Curves.easeInExpo.transform(
                max(0, currentPageValue),
              ),
              child: GestureDetector(
                onTap: () {
                  if(mapAnimation.value == 1) {
                    mapAnimationController..reverse();
                  } else {
                    mapAnimationController..forward();
                  }
                },
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text(
                    'ON MAP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              )),
          Container(
            width: 50.0,
            height: 50.0,
            alignment: Alignment.center,
            child: CirclePageIndicator(
              size: 6.0,
              selectedSize: 7.0,
              dotColor: Colors.white.withOpacity(0.6),
              dotSpacing: 12.0,
              selectedDotColor: Colors.white,
              itemCount: 2,
              currentPageNotifier: currentPageNotifier,
            ),
          ),
          Container(
            width: 50.0,
            height: 50.0,
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.share,
              color: Colors.white,
              size: 25.0,
            ),
          ),
        ],
      ),
    ));
  }

  Widget _buildMap() {
    return IgnorePointer(
      ignoring: true,
      child: Stack(
        children: [
          MapImage(
            mapAnimation: mapAnimation.value,
          ),
          CurvedRoute(
            mapAnimation: mapAnimation.value,
          ),
          MapDetails(
            mapAnimation: mapAnimation.value,
          )
        ],
      ),
    );
  }

}

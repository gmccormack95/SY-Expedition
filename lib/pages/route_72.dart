import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sy_expedition/util/app_colors.dart';
import 'package:sy_expedition/widgets/animal_overlay.dart';
import 'package:sy_expedition/widgets/small_app_bar.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:sy_expedition/widgets/leopard_widget.dart';
import 'package:sy_expedition/widgets/travel_details.dart';
import 'package:sy_expedition/widgets/vulture_widget.dart';

class Route72 extends StatefulWidget {
  @override
  _Route72State createState() => _Route72State();
}

class _Route72State extends State<Route72> with SingleTickerProviderStateMixin {
  AnimationController mapAnimationController;
  Animation mapAnimation;
  bool isMapDown = true;
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

    mapAnimationController = new AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 1000)
    )
    ..forward();
    mapAnimation = Tween(
      begin: 0.0, 
      end: isMapDown 
        ? 0.0 
        : 1.0
    ).animate(mapAnimationController);
    mapAnimationController.addListener((){
      setState(() {print(mapAnimation.value);});
    });
    super.initState();
  }

  _startMapAnimation(){
    mapAnimationController.reset();
    mapAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmallAppBar(),
      body: Container(
        color: AppColors.primary_black,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'SY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Container(
                    height: 20.0,
                    width: 20.0,
                    child: Image.asset(
                      'assets/images/menu.png'
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    PageView.builder(
                      physics: ClampingScrollPhysics(),
                      controller: pageController,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        if(index == 0){
                          return LeopardWidget(
                            opacity: Curves.easeInExpo.transform(
                              max(
                                0.0,
                                1.0 - ((currentPageValue ?? 0) - (index)).abs(),
                              ),
                            )
                          );
                        }else{
                          return VultureWidget(
                            opacity: Curves.easeInExpo.transform(
                              max(
                                0.0,
                                1.0 - ((currentPageValue ?? 0) - (index)).abs(),
                              ),
                            ),

                          );
                        }
                      },
                      onPageChanged: (index){
                        currentPageNotifier.value = index;
                      },
                    ),
                    AnimalOverlay(
                      pageValue: currentPageValue,
                    ),
                    TravelDetails(
                      pageValue: currentPageValue,
                      onTap: () {
                        setState(() {
                          this.isMapDown = !isMapDown;
                        });
                        mapAnimationController.reset();
                        mapAnimationController.forward();
                      },
                      isDown: isMapDown,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 100.0,
              padding: const EdgeInsets.only(left: 20, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Opacity(
                    opacity: Curves.easeInExpo.transform(
                      max(
                        0,
                        currentPageValue
                      ),
                    ),
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
                  ),
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
            ),
          ],
        )
      )
    );
  }
}
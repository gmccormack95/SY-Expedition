import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sy_expedition/pages/route_72.dart';
import 'package:sy_expedition/util/app_colors.dart';
import 'package:sy_expedition/widgets/remove_glow.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.primary_black
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    timeDilation = 1.5; 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Route72(),
      builder: (context, child) {
          return ScrollConfiguration(
            behavior: RemoveGlow(),
            child: child,
          );
        },
    );
  }
}
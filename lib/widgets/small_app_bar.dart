import 'package:flutter/material.dart';
import 'package:sy_expedition/util/app_colors.dart';


class SmallAppBar extends StatelessWidget implements PreferredSizeWidget {
  SmallAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary_black,
      elevation: 0.0,
    );
  }

    @override
  Size get preferredSize {
    return new Size.fromHeight(0.0);
  }


}
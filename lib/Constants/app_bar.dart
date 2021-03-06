import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blindtube/Constants/styles.dart';
import 'package:flutter/painting.dart';

class BlindSideAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        backgroundColor: kBackground,
        title: Center(
          child: Image.asset(
            'images/blind.png',
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}











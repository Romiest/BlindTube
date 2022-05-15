import 'package:blindtube/Constants/colors&Styles.dart';
import 'package:flutter/material.dart';
import 'package:blindtube/Constants/widgets.dart';


class VideoClick extends StatelessWidget {
  VideoClick(
      {required this.name, required this.title,required this.onPressed});

  String name;
  String title;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 150,
              child: Image.asset(
                'images/$name.png',
              ),
            ),
            Text(
              title,
              style: VideoTitleStyle,
            ),
          ],
        ),
        YellowLine(),
      ],

      ),
    );
  }
}
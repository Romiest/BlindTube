import 'package:blindtube/Constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:blindtube/Constants/widgets.dart';

import '../class/video.dart';






class VideoClick extends StatelessWidget {
  VideoClick(
      {required this.video,required this.onPressed});

 Video video;
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
                'images/${video.link}.png',
              ),
            ),
            Text(
              video.title,
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
import 'package:blindtube/Constants/styles.dart';
import 'package:blindtube/video_player/widgets/yellow_line.dart';
import 'package:flutter/material.dart';


import '../class/video.dart';






class VideoClick extends StatelessWidget {
  const VideoClick(
      {Key? key, required this.video,required this.onPressed}) : super(key: key);

 final Video video;
 final void Function() onPressed;

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
              style: kVideoTitleStyle,
            ),
          ],
        ),
        const YellowLine(),
      ],

      ),
    );
  }
}
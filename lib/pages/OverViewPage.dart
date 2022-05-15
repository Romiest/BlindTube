import 'package:flutter/material.dart';
import 'package:blindtube/Constants/widgets.dart';
import 'package:blindtube/Constants/colors&Styles.dart';
import 'package:blindtube/videoplayer/VideoClick.dart';
import 'package:blindtube/pages/VideoPage.dart';
import 'package:blindtube/Constants/functions.dart';

class OverViewPage extends StatelessWidget {
  OverViewPage(
      {required this.userName, required this.videos, required this.Titles});

  List videos;
  List Titles;
  String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: BlindSideAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(children: <Widget>[
            Text(
              'hello ${userName} , here are your videos for today',
              style: WelcomingStyle,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  return VideoClick(
                    name: videos[index],
                    title: Titles[index],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPage(
                            userName: userName,
                            VideoLocation: videos[index],
                            videoTitle: Titles[index],
                            RelatedVideos:
                                relatedVids(videos[index][0], videos[index]),
                            RelatedTitles:
                                relatedTitles(videos[index][0], Titles[index]),
                          ),
                        ),
                      );
                    },
                  );
                }),
          ]),
        ),
      ),
    );
  }
}

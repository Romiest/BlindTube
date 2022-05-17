import 'package:flutter/material.dart';
import 'package:blindtube/Constants/widgets.dart';
import 'package:blindtube/Constants/styles.dart';



import '../../video_player/widgets/VideoClick.dart';
import '../../video_player/class/video.dart';
import '../video_page/VideoPage.dart';




class OverViewPage extends StatelessWidget {
  const OverViewPage({Key? key, required this.userName, required this.videos})
      : super(key: key);

  final List<Video> videos;
  final String userName;

  List relatedVids(Video video) {
    List<Video> ans = [];
    for (int i = 0; i < videos.length; i++) {
      if (videos[i].tag == video.tag && videos[i] != video) {
        ans.add(videos[i]);
      }
    }

    return ans;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: BlindSideAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(children: <Widget>[
            Text(
              'hello $userName , here are your videos for today',
              style: WelcomingStyle,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  return VideoClick(
                    video: videos[index],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPage(
                            userName: userName,
                            video: videos[index],
                            relatedVideos: relatedVids(videos[index]),
                            relatedVidFunc: relatedVids,
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

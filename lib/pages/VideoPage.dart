import 'package:blindtube/Constants/colors&Styles.dart';
import 'package:blindtube/pages/CommentPage.dart';
import 'package:blindtube/videoplayer/VideoClick.dart';
import 'package:flutter/material.dart';
import 'package:blindtube/Constants/widgets.dart';
import 'package:blindtube/videoplayer/ChewieListItem.dart';
import 'package:video_player/video_player.dart';
import 'package:blindtube/Constants/functions.dart';

class VideoPage extends StatefulWidget {
  VideoPage(
      {required this.userName,
      required this.VideoLocation,
      required this.videoTitle,
      required this.RelatedVideos,
      required this.RelatedTitles});

  String userName;
  String VideoLocation;
  String videoTitle;
  List RelatedVideos;
  List RelatedTitles;

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      floatingActionButton: Visibility(
        visible: isSwitched,
        child: FloatingActionButton(
          child: Icon(
            Icons.comment,
            size: 30,
          ),
          backgroundColor: kblindColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CommentPage(Username: widget.userName)),
            );
          },
        ),
      ),
      appBar: BlindSideAppBar(),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              width: 500,
              height: 250,
              child: ChewieListItem(
                  videoPlayerController: VideoPlayerController.asset(
                      'videos/${widget.VideoLocation}.mp4'),
                  looping: true),
            ),
            Text(widget.videoTitle, style: VideoTitleStyle),
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Text(
                "Comments",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                activeTrackColor: kblindColor,
                activeColor: Colors.white,
              ),
            ]),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.RelatedVideos.length,
              itemBuilder: (context, index) {
                return VideoClick(
                    name: widget.RelatedVideos[index],
                    title: widget.RelatedTitles[index],
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPage(
                            userName: widget.userName,
                            VideoLocation: widget.RelatedVideos[index],
                            videoTitle: widget.RelatedTitles[index],
                            RelatedVideos: relatedVids(
                                widget.RelatedVideos[index][0],
                                widget.RelatedVideos[index]),
                            RelatedTitles: relatedTitles(
                                widget.RelatedVideos[index][0],
                                widget.RelatedTitles[index]),
                          ),
                        ),
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}

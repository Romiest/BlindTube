import 'package:blindtube/Constants/styles.dart';

import '../../video_player/widgets/chewie_list_item.dart';
import '../../video_player/widgets/video_click.dart';
import '../../video_player/class/video.dart';
import '../comment_page/comment_page.dart';

import 'package:flutter/material.dart';
import 'package:blindtube/Constants/app_bar.dart';

import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage(
      {Key? key,
      required this.userName,
      required this.video,
      required this.relatedVideos,
      required this.relatedVidFunc})
      : super(key: key);

  final String userName;
  final Function relatedVidFunc;
  final Video video;
  final List relatedVideos;

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
          child: const Icon(
            Icons.comment,
            size: 30,
          ),
          backgroundColor: kBlindColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CommentPage(userName: widget.userName)),
            );
          },
        ),
      ),
      appBar: BlindSideAppBar(),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              width: 500,
              height: 250,
              child: ChewieListItem(
                  videoPlayerController: VideoPlayerController.asset(
                      'videos/${widget.video.link}.mp4'),
                  looping: true),
            ),
            Text(widget.video.title, style: kVideoTitleStyle),
            const SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              const Text(
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
                activeTrackColor: kBlindColor,
                activeColor: Colors.white,
              ),
            ]),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.relatedVideos.length,
              itemBuilder: (context, index) {
                return VideoClick(
                    video: widget.relatedVideos[index],
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPage(
                            userName: widget.userName,
                            video: widget.relatedVideos[index],
                            relatedVidFunc: widget.relatedVidFunc,
                            relatedVideos: widget.relatedVidFunc(widget.relatedVideos[index]),
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

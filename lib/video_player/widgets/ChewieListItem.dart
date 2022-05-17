import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';


class ChewieListItem extends StatefulWidget {
  ChewieListItem({required this.videoPlayerController,required this.looping});
  final VideoPlayerController videoPlayerController;
    final  bool looping;


  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  late ChewieController  _chewieController;
  @override

  void initState() {

      _chewieController=ChewieController(videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16/9,
        autoInitialize: true,
        looping: widget.looping,
        errorBuilder: (context,errorMessage){
        return Center(
          child: Text(
            errorMessage,
            style:  TextStyle(
              color: Colors.white
            ),
          ),
        );
        }
      );

      super.initState();
  }
  // void initState(){
  //   super.initState();

  // }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
  @override
  void dispose(){
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}

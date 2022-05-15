import 'package:blindtube/Constants/colors&Styles.dart';
import 'package:blindtube/Constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:blindtube/comments/commentChild.dart';
class CommentPage extends StatefulWidget {
  CommentPage({required this.Username});
  String Username;
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata=[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBackground,
      appBar:BlindSideAppBar(),
      body: Container(
        child: CommentBox(
          userImage: 'https://thumbs.dreamstime.com/b/yellow-neon-icon-avatar-transparent-background-vector-dark-194270985.jpg',
          child: commentChild(filedata),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': widget.Username,
                  'pic':'https://thumbs.dreamstime.com/b/yellow-neon-icon-avatar-transparent-background-vector-dark-194270985.jpg',
                  'message': commentController.text
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}

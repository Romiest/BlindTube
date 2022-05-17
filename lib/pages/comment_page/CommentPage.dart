import 'package:blindtube/Constants/styles.dart';
import 'package:blindtube/Constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:blindtube/comments/commentChild.dart';
class CommentPage extends StatefulWidget {
  const CommentPage({Key? key, required this.userName}) : super(key: key);
   final String userName;
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List fileData=[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBackground,
      appBar:BlindSideAppBar(),
      body: CommentBox(
        userImage: 'https://thumbs.dreamstime.com/b/yellow-neon-icon-avatar-transparent-background-vector-dark-194270985.jpg',
        child: commentChild(fileData),
        labelText: 'Write a comment...',
        withBorder: false,
        errorText: 'Comment cannot be blank',
        sendButtonMethod: () {
          if (formKey.currentState!.validate()) {
            setState(() {
              var value = {
                'name': widget.userName,
                'pic':'https://thumbs.dreamstime.com/b/yellow-neon-icon-avatar-transparent-background-vector-dark-194270985.jpg',
                'message': commentController.text
              };
              fileData.insert(0, value);
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
        sendWidget: const Icon(Icons.send_sharp, size: 30, color: Colors.white),
      ),
    );
  }
}

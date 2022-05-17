import 'package:blindtube/pages/landing_page/widgets/blind_text_field.dart';
import 'package:blindtube/pages/landing_page/widgets/button_container.dart';
import 'package:blindtube/pages/landing_page/widgets/enter_user_text.dart';
import 'package:blindtube/pages/landing_page/widgets/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:blindtube/Constants/styles.dart';
import 'package:blindtube/Constants/widgets.dart';

import '../../video_player/class/video.dart';
import '../over_view_page/OverViewPage.dart';


class LandingPage extends StatelessWidget {

  final myController = TextEditingController();
  final List<Video> videos = [
    Video(link: "cats1", title: "Orange cats", tag: "cats"),
    Video(link: "cats2", title: "Blue Eyes", tag: "cats"),
    Video(link: "cats3", title: "Siamese cat", tag: "cats"),
    Video(link: "dogs1", title: "smiling dog", tag: "dogs"),
    Video(link: "dogs2", title: "2 puppies", tag: "dogs"),
    Video(link: "dogs3", title: "slow mo", tag: "dogs"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: BlindSideAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: ListView(
          children: <Widget>[
            EnterUserText(),
            const SizedBox(
              height: 30,
            ),
            BlindTextField(
              controller: myController,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                child: ButtonContainer(
                  icon: Icons.play_arrow,
                  text: "login",
                ),
                onPressed: () {
                  if (myController.text == "") {
                    showAlertDialog(context);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OverViewPage(
                                userName: myController.text,
                                videos: videos,
                              )),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

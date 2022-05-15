import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blindtube/Constants/colors&Styles.dart';
import 'package:blindtube/Constants/widgets.dart';
import 'package:blindtube/pages/OverViewPage.dart';

class LandingPage extends StatelessWidget {
  @override
  List Videos=["cats1","cats2","cats3","dogs1","dogs2","dogs3"];
  List Titles=["Orange cats","Blue Eyes","Siamese cat","smiling dog","2 puppies","slow mo"];
  final myController = TextEditingController();

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
            SizedBox(
              height: 30,
            ),
            BlindTextField(
              controller: myController,
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                child: ButtonContainer(icon: Icons.play_arrow,text: "login",),
                onPressed: () {
                  if (myController.text == "") {
                    showAlertDialog(context);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OverViewPage(
                            userName: myController.text,
                            videos: Videos,
                            Titles: Titles,
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

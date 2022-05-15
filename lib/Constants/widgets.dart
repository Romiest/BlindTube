import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blindtube/Constants/colors&Styles.dart';
import 'package:flutter/painting.dart';

class BlindSideAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        backgroundColor: kBackground,
        title: Center(
          child: Image.asset(
            'images/blind.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class EnterUserText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.person_pin,
            color: kblindColor,
            size: 45,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Please enter your username',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class BlindTextField extends StatelessWidget {
  BlindTextField({required this.controller});

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'username',
            hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  ButtonContainer({required this.icon, required this.text});

  String text;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: kblindColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
          )
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text("please enter your username"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class YellowLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Divider(
        color: kblindColor,
        thickness: 1,
      ),
    );
  }
}

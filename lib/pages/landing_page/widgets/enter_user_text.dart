import 'package:flutter/material.dart';

import '../../../Constants/styles.dart';

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
            color: kBlindColor,
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
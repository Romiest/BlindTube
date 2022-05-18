import 'package:flutter/material.dart';

import '../../../Constants/styles.dart';

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
        color: kBlindColor,
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
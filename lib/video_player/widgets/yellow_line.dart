import 'package:flutter/material.dart';

import '../../Constants/styles.dart';

class YellowLine extends StatelessWidget {
  const YellowLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Divider(
        color: kBlindColor,
        thickness: 1,
      ),
    );
  }
}
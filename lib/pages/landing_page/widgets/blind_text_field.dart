import 'package:flutter/material.dart';

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
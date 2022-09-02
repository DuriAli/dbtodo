import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedTextField extends StatelessWidget {
  final String hinttext;
  final Function onChanged;
  RoundedTextField({this.hinttext, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 250,
      child: TextField(
        onChanged: onChanged,
        textAlign: TextAlign.center,
        style: TextStyle(color: kPrimaryWhite),
        decoration: InputDecoration(
          fillColor: kPrimaryWhite,
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: kPrimaryWhite.withOpacity(0.3), width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: kPrimaryWhite.withOpacity(0.5), width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
          labelStyle: TextStyle(
            color: kPrimaryWhite.withOpacity(0.3),
          ),
          labelText: hinttext,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryWhite, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

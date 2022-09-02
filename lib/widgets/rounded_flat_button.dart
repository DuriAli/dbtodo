import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedFlatButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;

  RoundedFlatButton({this.onPressed, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 250,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: color == kSecondaryAccentColor
              ? BorderSide.none
              : BorderSide(color: kPrimaryWhite, width: 2),
        ),
        color: color == kSecondaryAccentColor ? kSecondaryAccentColor : null,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: kPrimaryWhite),
        ),
      ),
    );
  }
}

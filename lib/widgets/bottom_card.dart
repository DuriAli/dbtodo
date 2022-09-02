import 'package:flutter/material.dart';

import '../constants.dart';

class BottomCard extends StatelessWidget {
  final Widget child;
  final IconData icon;
  final double height;
  final Function onPressed;

  BottomCard({this.child, this.height, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: kPrimaryBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                ),
              ),
              height: height,
              width: double.infinity,
              child: child,
            ),
          ],
        ),
        Positioned(
          top: -35,
          width: 70,
          height: 70,
          child: FlatButton(
            child: Icon(
              icon,
              size: 35,
              color: kPrimaryWhite,
            ),
            onPressed: onPressed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(700),
            ),
            color: kPrimaryAccentColor,
          ),
        )
      ],
    );
  }
}

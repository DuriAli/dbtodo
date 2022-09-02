import 'package:flutter/material.dart';

import '../constants.dart';

Container getWelcomeText(double fontSize) {
  return Container(
    child: Text(
      'Welcome to',
      style: TextStyle(
          fontSize: fontSize, color: kPrimaryTextColor, fontFamily: 'Roboto'),
    ),
  );
}

Text getStartedText(Color color, String text) {
  return Text(
    text,
    style: TextStyle(
        color: color == null ? kPrimaryAccentColor : color,
        fontWeight: FontWeight.bold,
        fontSize: 30),
  );
}

Container getLogo(double fontSize) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('dbT', style: kLogoTextStyle.copyWith(fontSize: fontSize)),
        Image(
            image: AssetImage('assets/images/Logo.png'),
            height: fontSize - 5,
            width: fontSize - 5),
        Text(
          'DO',
          style: kLogoTextStyle.copyWith(fontSize: fontSize),
        ),
      ],
    ),
  );
}

Container getSubText(TextAlign textAlign, double offsetx, double fontSize) {
  return Container(
    width: double.infinity,
    child: Transform.translate(
      offset: Offset(offsetx, 0),
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          style: TextStyle(
            fontSize: fontSize,
            color: kPrimaryTextColor.withOpacity(0.75),
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'The Only',
            ),
            TextSpan(
              text: '\nTask Manager',
              style: TextStyle(
                  fontSize: fontSize,
                  color: kPrimaryTextColor.withOpacity(0.75),
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: '\nYou\'ll Need',
            ),
          ],
        ),
      ),
    ),
  );
}

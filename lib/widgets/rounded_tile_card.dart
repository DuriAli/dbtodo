import 'package:dbtodo/models/task.dart';
import 'package:dbtodo/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedTileCard extends StatefulWidget {
  final String taskText;
  final Function callback;

  RoundedTileCard({this.taskText, this.callback});

  @override
  _RoundedTileCardState createState() => _RoundedTileCardState();
}

class _RoundedTileCardState extends State<RoundedTileCard> {
  bool blnValue = false;
  String taskText;
  Function callback;

  @override
  void initState() {
    super.initState();
    taskText = widget.taskText;
    callback = widget.callback;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Checkbox(
              value: blnValue,
              onChanged: (bool value) async {
                blnValue = value;
                await callback(taskText);
                setState(() {});
              },
              focusColor: kPrimaryWhite,
              activeColor: kPrimaryWhite,
              hoverColor: kPrimaryWhite,
              checkColor: kPrimaryTextColor,
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              taskText,
              style: TextStyle(
                  color: kPrimaryWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryBlue,
        ),
      ),
    );
  }
}

import 'package:dbtodo/screens/home_screen.dart';
import 'package:dbtodo/services/db_helper_functions.dart';
import 'package:dbtodo/services/fade_route_transition.dart';
import 'package:dbtodo/services/helper_functions.dart';
import 'package:dbtodo/widgets/bottom_card.dart';
import 'package:dbtodo/widgets/rounded_flat_button.dart';
import 'package:dbtodo/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String userPW;
  String userID;
  bool isUpdating;

  @override
  void initState() {
    super.initState();
    isUpdating = false;
  }

  @override
  void dispose() {
    super.dispose();
    //dbHelper2.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 3,
            ),
            Hero(tag: 'WelcomeText', child: getWelcomeText(18)),
            Hero(
              tag: 'Logo',
              child: getLogo(65),
            ),
            Spacer(
              flex: 1,
            ),
            Hero(tag: 'SubText', child: getSubText(TextAlign.center, 0, 20)),
            Spacer(
              flex: 2,
            ),
            Hero(
              tag: 'BottomCard',
              child: BottomCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Spacer(
                      flex: 2,
                    ),
                    getStartedText(kPrimaryWhite, 'Log In To Your Account'),
                    Spacer(
                      flex: 2,
                    ),
                    RoundedTextField(
                      hinttext: 'Enter Your UserID',
                      onChanged: (value) {
                        userID = value;
                      },
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    RoundedTextField(
                      hinttext: 'Enter Your UserPW',
                      onChanged: (value) {
                        userPW = value;
                      },
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    RoundedFlatButton(
                      text: 'Log In',
                      color: kSecondaryAccentColor,
                      onPressed: () async {
                        // print(userID.toString());
                        // bool result = await dbHelper2.isUser(int.parse(userID));
                        // print(result);
                      },
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height / 1.9,
                icon: Icons.arrow_back,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

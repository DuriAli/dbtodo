import 'package:dbtodo/services/db_helper_functions.dart';
import 'package:dbtodo/services/fade_route_transition.dart';
import 'package:dbtodo/services/helper_functions.dart';
import 'package:dbtodo/widgets/bottom_card.dart';
import 'package:dbtodo/widgets/rounded_flat_button.dart';
import 'package:dbtodo/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String userName;
  String userPW;
  bool isUpdating;

  @override
  void initState() {
    super.initState();
    isUpdating = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kPrimaryWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Spacer(
                          flex: 2,
                        ),
                        getStartedText(kPrimaryWhite, 'Sign Up For An Account'),
                        Spacer(
                          flex: 2,
                        ),
                        RoundedTextField(
                          hinttext: 'Enter Your User Name',
                          onChanged: (value) {
                            userName = value;
                          },
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        RoundedTextField(
                          hinttext: 'Enter Your Password',
                          onChanged: (String value) {
                            userPW = value;
                          },
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        RoundedFlatButton(
                          text: 'Sign Up',
                          onPressed: () async {
                            // await dbHelper2.cleanDB();
                            // User user = User(userName, int.parse(userPW));
                            // print('before');
                            // User user1 = await dbHelper2.save(user);
                            // print('after');
                            // print(user1.toMap());
                          },
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
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
      ),
    );
  }
}

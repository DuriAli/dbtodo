import 'package:dbtodo/screens/sign_up_screen.dart';
import 'package:dbtodo/services/db_helper_functions.dart';
import 'package:dbtodo/services/fade_route_transition.dart';
import 'package:dbtodo/services/helper_functions.dart';
import 'package:dbtodo/widgets/bottom_card.dart';
import 'package:dbtodo/widgets/rounded_flat_button.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'log_in_screen.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kPrimaryWhite,
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
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
                Hero(
                    tag: 'SubText', child: getSubText(TextAlign.center, 0, 20)),
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
                          getStartedText(kPrimaryWhite, 'Let\'s Get Started'),
                          Spacer(
                            flex: 2,
                          ),
                          RoundedFlatButton(
                            text: 'Log In',
                            color: kSecondaryAccentColor,
                            onPressed: () {
                              Navigator.push(
                                context,
                                FadeRoute(
                                  builder: (context) => LogInScreen(),
                                ),
                              );
                            },
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          RoundedFlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  FadeRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            text: 'Sign Up',
                            color: null,
                          ),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 1.9,
                    icon: Icons.arrow_downward,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

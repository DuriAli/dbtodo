import 'package:dbtodo/services/db_helper_functions.dart';
import 'package:dbtodo/services/fade_route_transition.dart';
import 'package:dbtodo/services/helper_functions.dart';
import 'package:dbtodo/widgets/bottom_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'account_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kPrimaryWhite,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(
                  flex: 2,
                ),
                Hero(tag: 'WelcomeText', child: getWelcomeText(20)),
                Hero(tag: 'Logo', child: getLogo(80)),
                Spacer(
                  flex: 1,
                ),
                Hero(
                  tag: 'SubText',
                  child: getSubText(TextAlign.start,
                      MediaQuery.of(context).size.width / 8, 30),
                ),
                Spacer(
                  flex: 2,
                ),
                Hero(
                  tag: 'BottomCard',
                  child: BottomCard(
                    child: Center(
                        child: getStartedText(
                            kPrimaryWhite, 'Let\'s Get Started')),
                    height: MediaQuery.of(context).size.height / 4,
                    icon: Icons.arrow_upward,
                    onPressed: () {
                      Navigator.push(
                        context,
                        FadeRoute(
                          builder: (context) => AccountScreen(),
                        ),
                      );
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

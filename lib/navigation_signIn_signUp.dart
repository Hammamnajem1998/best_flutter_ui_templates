import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/custom_drawer/drawer_user_controller_signUp.dart';
// import 'package:best_flutter_ui_templates/custom_drawer/home_drawer.dart';
import 'package:best_flutter_ui_templates/custom_drawer/home_drawer_signUp.dart';
import 'package:best_flutter_ui_templates/feedback_screen.dart';
import 'package:best_flutter_ui_templates/help_screen.dart';
import 'package:best_flutter_ui_templates/home_screen.dart';
import 'package:best_flutter_ui_templates/invite_friend_screen.dart';
import 'package:flutter/material.dart';

class NavigationSignInSignUp extends StatefulWidget {
  @override
  _NavigationSignInSignUp createState() => _NavigationSignInSignUp();
}

class _NavigationSignInSignUp extends State<NavigationSignInSignUp> {
  Widget screenView;
  DrawerIndexSignUp drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndexSignUp.SignIn;
    screenView = const MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserControllerSignUP(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndexSignUp drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndexSignUp drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndexSignUp.SignIn) {
        setState(() {
          screenView = const MyHomePage();
        });
      } else if (drawerIndex == DrawerIndexSignUp.SignUpCareer) {
        setState(() {
          screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndexSignUp.SignUpUser) {
        setState(() {
          screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndexSignUp.About) {
        setState(() {
          screenView = InviteFriend();
        });
      } else {
        //do in your way......
      }
    }
  }
}

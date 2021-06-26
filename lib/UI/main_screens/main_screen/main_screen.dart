import 'package:covid19/UI/main_screens/main_screen/body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/mainScreen";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainScreenBody(),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home)),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.facebookMessenger)),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.userAlt)),
      ]),
    );
  }
}

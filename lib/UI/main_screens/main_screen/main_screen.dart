import 'package:covid19/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/mainScreen";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(color: MColors.covidMain),
              child: SafeArea(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 75.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: MColors.covidThird,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25))),
                ),
              )),
            ),
            Positioned(
              right: -60,
              top: -60,
              child: Container(
                  height: 25.h,
                  width: 25.h,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.cover,
                  )),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
                    child: Text(
                      "Covid-19",
                      style: TextStyle(
                          fontFamily: "Plex",
                          color: MColors.covidThird,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    )),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.facebookMessenger),
          label: "Chat",
        ),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userAlt), label: "Profile"),
      ],
      selectedItemColor: MColors.covidMain,
    );
  }
}

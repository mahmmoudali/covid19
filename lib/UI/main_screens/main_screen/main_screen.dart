import 'package:covid19/colors.dart';
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
              right: 0,
              top: 0,
              child: Container(
                  height: 15.h,
                  width: 15.h,
                  child: Positioned(
                    top: 0,
                    child: CircleAvatar(
                      maxRadius: 10,
                      minRadius: 10,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "assets/images/logo-trial.png",
                        fit: BoxFit.cover,
                      ),
                    ),
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

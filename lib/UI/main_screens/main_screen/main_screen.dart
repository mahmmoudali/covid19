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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(color: MColors.covidMain)),
          Positioned(
              top: 7.h,
              right: 21.w,
              child: Row(
                children: [
                  Text("Cairo, Egypt",
                      style: TextStyle(
                          fontFamily: "Plex", color: MColors.covidThird)),
                  Icon(Icons.arrow_drop_down, color: MColors.covidThird)
                ],
              )),
          buildTotalCases(),
          buildVirusIcon(),
          SafeArea(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: MColors.covidThird,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.h),
                      topLeft: Radius.circular(5.h))),
              child: Column(
                children: [
                  Spacer(),
                  buildCovidCheckContainer(),
                  Spacer(),
                  // SizedBox(height: 5.h),
                  buildHomeIcons(),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      HomeItem(
                          icon: Icon(FontAwesomeIcons.mapMarkerAlt,
                              color: MColors.covidMain, size: 4.h),
                          text: "Map"),
                      Spacer(),
                      HomeItem(
                          icon: Icon(FontAwesomeIcons.info,
                              color: MColors.covidMain, size: 4.h),
                          text: "Information"),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          )),
          // Positioned(
          //   right: 0,
          //   top: 0,
          //   child: Container(
          //       height: 15.h,
          //       width: 15.h,
          //       child: Positioned(
          //         top: 0,
          //         child: CircleAvatar(
          //           maxRadius: 10,
          //           minRadius: 10,
          //           backgroundColor: Colors.white,
          //           child: Image.asset(
          //             "assets/images/logo-trial.png",
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       )),
          // ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Positioned buildVirusIcon() {
    return Positioned(
        top: 12.h,
        left: -10.w,
        child: Opacity(
          opacity: .8,
          child: Image(
              image: AssetImage("assets/images/virus.png"),
              height: 20.h,
              width: 20.h),
        ));
  }

  Positioned buildTotalCases() {
    return Positioned(
      top: 10.h,
      right: 20.w,
      child: Container(
        height: 10.h,
        width: 30.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("6738",
                style: TextStyle(
                    fontFamily: "Plex",
                    fontWeight: FontWeight.bold,
                    color: MColors.covidThird,
                    fontSize: 30.sp)),
            Text("Total Cases",
                style: TextStyle(
                    fontFamily: "Plex",
                    // fontWeight: FontWeight.bold,
                    color: MColors.covidThird,
                    fontSize: 12.sp)),
          ],
        ),
      ),
    );
  }

  Row buildHomeIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        HomeItem(
            icon: Icon(FontAwesomeIcons.mapMarkedAlt,
                color: MColors.covidMain, size: 4.h),
            text: "Map"),
        Spacer(),
        HomeItem(
            icon: Icon(FontAwesomeIcons.info,
                color: MColors.covidMain, size: 4.h),
            text: "Information"),
        Spacer(),
        HomeItem(
            icon: Icon(FontAwesomeIcons.mapMarkedAlt,
                color: MColors.covidMain, size: 4.h),
            text: "Map"),
        Spacer()
      ],
    );
  }

  Container buildCovidCheckContainer() {
    return Container(
      height: 18.h,
      width: 90.w,
      padding: EdgeInsets.only(left: 2.w, right: 2.h, top: 2.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              // color: Colors.amber,
              color: Colors.grey[200],
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 5))
        ],
        color: Color(0xFFF3F4F5),
        borderRadius: BorderRadius.circular(3.h),

        // border: Border.all()
      ),
      child: Row(
        children: [
          Image(image: AssetImage("assets/images/doctor.png")),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Covid Check",
                  style: TextStyle(
                      fontFamily: "Plex",
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp)),
              Text("Based on common\nsyndrome",
                  style: TextStyle(fontFamily: "Plex", fontSize: 10.sp)),
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: MColors.kTextColor, size: 2.h),
          Spacer(),
        ],
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
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

class HomeItem extends StatelessWidget {
  const HomeItem({
    this.icon,
    this.text,
    Key key,
  }) : super(key: key);
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10.h,
          width: 10.h,
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  // color: Colors.amber,
                  color: Colors.grey[200],
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 5))
            ],
            color: Color(0xFFF3F4F5),
            borderRadius: BorderRadius.circular(3.h),

            // border: Border.all()
          ),
          child: icon,
        ),
        SizedBox(height: 1.5.h),
        Text(text, style: TextStyle(fontFamily: "Plex"))
      ],
    );
  }
}

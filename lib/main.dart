import 'package:covid19/UI/main_screens/home/home.dart';
import 'package:covid19/UI/main_screens/main_screen/main_screen.dart';
import 'package:covid19/colors.dart';
import 'package:covid19/routes.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'UI/user/login/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: 'Covid 19',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: MColors.covidMain,
        ),
        initialRoute: MainScreen.routeName,
        routes: Routes.routes,
      ),
    );
  }
}

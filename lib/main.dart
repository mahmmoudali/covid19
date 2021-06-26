import 'package:covid19/UI/main_screens/main_screen/main_screen.dart';
import 'package:covid19/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
        theme: ThemeData.light().copyWith(
          primaryColor: MColors.covidMain,
        ),
        home: MainScreen(),
      ),
    );
  }
}

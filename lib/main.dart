import 'package:covid19/UI/main_screens/covid_check/covid_check_screen.dart';
import 'package:covid19/UI/main_screens/map_screen/map_screen.dart';
import 'package:covid19/UI/user/edit_profile/edit_profileScreen.dart';
import 'package:covid19/UI/user/login/sign_in.dart';
import 'package:covid19/colors.dart';
import 'package:covid19/routes.dart';

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
        theme: ThemeData(
          primaryColor: MColors.covidMain,
        ),
        initialRoute: SignInScreen.routeName,
        routes: Routes.routes,
      ),
    );
  }
}

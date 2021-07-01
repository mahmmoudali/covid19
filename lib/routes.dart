import 'package:covid19/UI/main_screens/covid_check/covid_check_screen.dart';
import 'package:covid19/UI/main_screens/home/home.dart';
import 'package:covid19/UI/main_screens/main_screen/main_screen.dart';
import 'package:covid19/UI/main_screens/map_screen/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'UI/user/edit_profile/edit_profileScreen.dart';
import 'UI/user/login/sign_in.dart';
import 'UI/user/register/sign_up_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    HomeScreen.routeName: (context) => HomeScreen(),
    MainScreen.routeName: (context) => MainScreen(),
    SignInScreen.routeName: (context) => SignInScreen(),
    SignUpScreen.routeName: (context) => SignUpScreen(),
    MapScreen.routeName: (context) => MapScreen(),
    CovidCheckScreen.routeName: (context) => CovidCheckScreen(),
    EditProfileScreen.routeName: (context) => EditProfileScreen(),
  };
}

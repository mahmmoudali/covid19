import 'package:covid19/UI/main_screens/home/home.dart';
import 'package:covid19/UI/main_screens/main_screen/main_screen.dart';
import 'package:covid19/UI/user/register/signUp.dart';
import 'package:covid19/UI/user/sign_in/sign_in.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  MainScreen.routeName: (context) => MainScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
};

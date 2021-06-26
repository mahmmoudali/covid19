import 'package:covid19/UI/user/sign_in/body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/signInScreen";
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SignInBody();
  }
}

import 'package:covid19/UI/user/register/body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/signUpScreen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SignUpBody();
  }
}

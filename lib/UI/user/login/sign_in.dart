import 'package:covid19/UI/components/social_card.dart';
import 'package:covid19/UI/user/login/components/sign_form.dart';
import 'package:covid19/UI/user/register/sign_up_screen.dart';
import 'package:covid19/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/signInScreen";
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    //hello ali
    // hello waka time

    return Scaffold(
        // appBar: AppBar(title: Text('Sign in'), centerTitle: true),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: Column(
              children: <Widget>[
                buildLogoArea(),
                SizedBox(height: 2.h),
                SignForm(),
                SizedBox(height: 5.h),
                buildSocialLogin(),
                SizedBox(height: 7.h),
                buildDontHaveAnAccount()
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Row buildDontHaveAnAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(fontSize: 4.w),
        ),
        GestureDetector(
          onTap: () {
            // setState(() {
            Navigator.pushNamed(context, SignUpScreen.routeName);
            // });
          },
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: 4.w, color: Colors.lightGreen),
          ),
        ),
      ],
    );
  }

  Widget buildSocialLogin() {
    return Column(
      children: [
        Text(
          "Or you can login with",
          style: TextStyle(fontFamily: "Plex", color: MColors.kTextColor),
        ),
        SizedBox(height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialCard(
              icon: 'assets/icons/google-icon.svg',
              press: () {},
            ),
            SocialCard(
              icon: 'assets/icons/facebook-2.svg',
              press: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget buildLogoArea() {
    return Column(
      children: [
        Container(
          height: 15.h,
          width: 20.h,
          child: Image.asset("assets/images/logo-trial.png"),
        ),
        SizedBox(height: .3.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "COVID-19 ",
              style: TextStyle(
                  fontFamily: "Plex",
                  fontSize: 2.5.h,
                  fontWeight: FontWeight.bold,
                  color: MColors.covidMain),
            ),
            Text(
              "APP",
              style: TextStyle(
                  fontFamily: "Plex",
                  fontSize: 2.5.h,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen),
            )
          ],
        ),
      ],
    );
  }
}

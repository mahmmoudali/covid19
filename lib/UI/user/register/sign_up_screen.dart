import 'package:covid19/UI/components/social_card.dart';
import 'package:covid19/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = '/sign_up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          child: Column(
            children: [
              buildBackToLoginArrow(context),
              buildLogoArea(),
              SignUpForm(),
              SizedBox(height: 5.h),
              buildSocialLogin(),
              SizedBox(height: 2.h),
              Text(
                  'By Continuing your confirm that means you \nagree with our terms and conditions ',
                  textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    ));
  }

  Align buildBackToLoginArrow(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios, size: 2.h),
              Text(
                "login",
                style: TextStyle(color: MColors.kTextColor),
              )
            ],
          )),
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

  buildSocialLogin() {
    return Column(
      children: [
        Text(
          "Or you can register with",
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
}

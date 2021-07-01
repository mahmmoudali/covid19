import 'package:covid19/UI/components/custom_suffix_icon.dart';
import 'package:covid19/UI/components/default_button.dart';
import 'package:covid19/UI/components/social_card.dart';
import 'package:covid19/colors.dart';
import 'package:covid19/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class EditProfileScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String email, password, name, age;

  static String routeName = '/editProfileScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildButtonBack(context),
              buildLogoArea(),
              Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    width: double.infinity,
                    child: Column(
                      children: [
                        buildNameTextFormField(),
                        SizedBox(height: 2.h),
                        buildAgeTextFormField(),
                        SizedBox(height: 2.h),
                        buildEmailTextFormField(),
                        SizedBox(height: 5.h),
                        DefaultButton(
                          text: 'Save',
                          press: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              // Navigator.pushNamed(
                              //     context, ComlpleteProfileScreen.routeName);

                            }
                          },
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    ));
  }

  TextFormField buildAgeTextFormField() {
    return TextFormField(
      onSaved: (newValue) => age = newValue,
      validator: (value) {
        if (value.isEmpty) return "You must enter your age";
      },
      onFieldSubmitted: (value) {
        _formKey.currentState.validate();
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        // hintText: 'Enter your email',
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Icon(FontAwesomeIcons.calendarAlt),
        ),
        labelText: 'Age',
      ),
    );
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (value.isEmpty)
          return "You must enter an email";
        else if (!emailValidatorRegExp.hasMatch(value))
          return "You must enter a valid email";
      },
      onFieldSubmitted: (value) {
        _formKey.currentState.validate();
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        // hintText: 'Enter your email',
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Mail.svg',
        ),
        labelText: 'Email',
      ),
    );
  }

  TextFormField buildNameTextFormField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue,
      validator: (value) {
        if (value.isEmpty) return "You must enter your name";
      },
      onFieldSubmitted: (value) {
        _formKey.currentState.validate();
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        // hintText: 'Enter your email',
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/User.svg',
        ),
        labelText: 'Name',
      ),
    );
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
    return Container(
      height: 25.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Container(
                width: 40.w,
                child: GestureDetector(
                  onTap: () {
                    // provider2?.getImage(mPresenter);
                  },
                  child: CircleAvatar(
                    radius: 25.h,
                    backgroundColor: MColors.covidMain,
                    backgroundImage: AssetImage(
                      "assets/images/pp.jpg",
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 3.h,
            right: 30.w,
            child: GestureDetector(
              onTap: () {
                // provider2?.getImage(mPresenter);
              },
              child: Container(
                width: 8.w,
                height: 8.w,
                decoration: new BoxDecoration(
                  color: MColors.covidMain.withOpacity(.9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 4.w,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildButtonBack(BuildContext context) {
    return Positioned(
      top: 6.h,
      left: 0,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: EdgeInsets.all(1.h),
          width: 5.h,
          height: 5.h,
          child: Icon(Icons.arrow_back_ios, color: MColors.covidMain),
        ),
      ),
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

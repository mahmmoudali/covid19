import 'package:covid19/UI/components/custom_suffix_icon.dart';
import 'package:covid19/UI/components/default_button.dart';
import 'package:covid19/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({
    Key key,
  }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> errors = [];

  String email, password, name, age;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          width: double.infinity,
          child: Column(
            children: [
              buildNameFormField(),
              SizedBox(height: 1.h),
              buildAgeFormField(),
              SizedBox(height: 1.h),
              buildEmailFormField(),
              SizedBox(height: 1.h),
              buildPasswordFormField(),
              SizedBox(height: 4.h),
              DefaultButton(
                text: 'Continue',
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
        ));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if (value.isEmpty)
          return "You must enter a password";
        else if (value.length < 8) return "Password must be more than 8 chars";
      },
      onFieldSubmitted: (value) {
        _formKey.currentState.validate();
      },
      obscureText: true,
      decoration: InputDecoration(
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        // hintText: 'nter your password',
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
        labelText: 'Password',
      ),
    );
  }

  TextFormField buildEmailFormField() {
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

  TextFormField buildNameFormField() {
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

  TextFormField buildAgeFormField() {
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
}

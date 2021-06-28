import 'package:covid19/colors.dart';
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Colors,
        FlatButton,
        Key,
        RoundedRectangleBorder,
        SizedBox,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:sizer/sizer.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.press,
    this.text,
  }) : super(key: key);
  final Function press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 6.h,
      child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: MColors.covidMain,
          onPressed: press,
          child: Text(
            '$text',
            style: TextStyle(fontSize: 5.w, color: Colors.white),
          )),
    );
  }
}

import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            'Body',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}

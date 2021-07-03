import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  String _totalCases;

  HomeProvider() {
    this._totalCases = "";
  }

  get totalCases => this._totalCases;

  set totalCases(value) {
    this._totalCases = value;
    notifyListeners();
  }
}

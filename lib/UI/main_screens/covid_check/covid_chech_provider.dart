import 'package:covid19/UI/main_screens/covid_check/symptom.dart';
import 'package:flutter/material.dart';

class CovidCheckProvider extends ChangeNotifier {
  double _progress = 0.0;

  get progress => _progress;

  double checkSymptom(List<Symptom> symptoms) {
    _progress = 0.0;
    symptoms.forEach((symptom) {
      if (symptom.isSelected == true) _progress = _progress + 0.25;
    });
    notifyListeners();
    return _progress;
  }
}

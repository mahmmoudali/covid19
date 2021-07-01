import 'package:covid19/UI/components/default_button.dart';
import 'package:covid19/UI/main_screens/covid_check/covid_chech_provider.dart';
import 'package:covid19/UI/main_screens/covid_check/symptom.dart';
import 'package:covid19/UI/main_screens/map_screen/map_screen.dart';
import 'package:covid19/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CovidCheckScreen extends StatefulWidget {
  static String routeName = "/covidCheckScreen";
  @override
  _CovidCheckScreenState createState() => _CovidCheckScreenState();
}

class _CovidCheckScreenState extends State<CovidCheckScreen> {
  Symptom fever;
  Symptom shortnessOfBreathing;
  Symptom dryCough;
  Symptom fatigue;
  double progress;
  @override
  void initState() {
    fever = Symptom(name: "Fever");
    shortnessOfBreathing = Symptom(name: "Shortness of breathing");
    dryCough = Symptom(name: "Dry cough");
    fatigue = Symptom(name: "Fatigue");
    progress = 0.0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(color: MColors.covidMain)),
          buildButtonBack(context),
          buildSymptomCheck(),
          buildProgressBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70.h,
              width: 100.w,
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
              decoration: BoxDecoration(
                  color: MColors.covidThird,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.h),
                      topLeft: Radius.circular(5.h))),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      buildMainTitleText(),
                      buildSymptoms(),
                    ],
                  ),
                  buildNextButton()
                ],
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
      left: 5.w,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: EdgeInsets.all(1.h),
          width: 5.h,
          height: 5.h,
          child: Icon(Icons.arrow_back_ios, color: MColors.covidThird),
        ),
      ),
    );
  }

  Positioned buildProgressBar() {
    return Positioned(
        top: 22.h,
        child: LinearPercentIndicator(
            width: 75.w,
            lineHeight: 14.0,
            percent: progress,
            backgroundColor: MColors.covidThird.withOpacity(.5),
            progressColor: progress > 0.75
                ? Colors.red
                : progress > .50
                    ? Colors.amber
                    : progress > .25
                        ? Colors.white
                        : Colors.green));
  }

  Positioned buildNextButton() {
    return Positioned(
      bottom: 0,
      right: 5.w,
      child: SizedBox(
        width: 40.w,
        child: DefaultButton(
          text: "Next",
          press: () {},
        ),
      ),
    );
  }

  Container buildMainTitleText() {
    return Container(
      height: 18.h,
      width: 90.w,
      padding: EdgeInsets.only(left: 2.w, right: 2.h, top: 2.h),
      decoration: BoxDecoration(

          // border: Border.all()
          ),
      child: Text(
          "Check all symptoms you have experienced in the past 2 weeks:",
          style: TextStyle(
              fontFamily: "Plex",
              fontWeight: FontWeight.bold,
              fontSize: 18.sp)),
    );
  }

  Positioned buildVirusIcon() {
    return Positioned(
        top: 12.h,
        left: -10.w,
        child: Opacity(
          opacity: .8,
          child: Image(
              image: AssetImage("assets/images/virus.png"),
              height: 20.h,
              width: 20.h),
        ));
  }

  Positioned buildSymptomCheck() {
    return Positioned(
      top: 14.h,
      left: 13.w,
      child: Text("Covid Check",
          style: TextStyle(
              fontFamily: "Plex",
              fontWeight: FontWeight.bold,
              color: MColors.covidThird,
              fontSize: 30.sp)),
    );
  }

  Widget buildSymptoms() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SymptomItem(symptom: fever),
              Spacer(),
              SymptomItem(symptom: shortnessOfBreathing),
              Spacer(),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              SymptomItem(symptom: dryCough),
              Spacer(),
              SymptomItem(symptom: fatigue),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  checkSymptom(List<Symptom> symptoms) {
    progress = 0.0;
    symptoms.forEach((symptom) {
      if (symptom.isSelected == true) progress = progress + 0.25;
    });
  }

  Widget SymptomItem({@required Symptom symptom}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          symptom.isSelected = !symptom.isSelected;
          checkSymptom([fever, shortnessOfBreathing, fatigue, dryCough]);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey[200],
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 5))
          ],
          color: symptom.isSelected ? MColors.covidMain : MColors.covidFifth,
          borderRadius: BorderRadius.circular(1.h),

          // border: Border.all()
        ),
        child: Text(symptom.name,
            style: TextStyle(
                fontFamily: "Plex",
                fontWeight: FontWeight.bold,
                color:
                    symptom.isSelected ? MColors.covidThird : MColors.covidMain,
                fontSize: 12.sp)),
      ),
    );
  }
}

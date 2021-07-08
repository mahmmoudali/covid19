import 'package:covid19/UI/components/default_button.dart';
import 'package:covid19/UI/main_screens/info_screen/model/info_model.dart';
import 'package:covid19/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'info_detais/info_details_screen.dart';

class InfoScreen extends StatelessWidget {
  static String routeName = "/InofScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAppBar(context),
                Expanded(
                  child: ListView(
                    children: [
                      InfoItem(
                        assetImage: "assets/images/covid.jpg",
                        title: "Whats is COVID-19 ?",
                        description:
                            "COVID-19 is an infectious disease caused by the last detected strain of coronavirus. There was no knowledge of this new virus and its disease before its outbreak began in the Chinese city of Wuhan in December 2019. COVID-19 has now turned into a pandemic affecting many countries in the world.",
                      ),
                      InfoItem(
                          title: "Covid Mask",
                          description:
                              '''There is currently no evidence to support or deny the usefulness of wearing masks (medical or other) for healthy people in the community in general. However, the organization is studying the rapidly developing scientific knowledge about masks and constantly updating its guidelines in this regard.
Medical masks are recommended primarily in healthcare facilities, but may be considered for use in other circumstances as well (see below). The use of medical masks should be combined with other key infection prevention and control measures, such as hand hygiene and physical distancing.''',
                          assetImage: "assets/images/baby.jpg"),
                      InfoItem(
                          title: "How to protect myself ?",
                          description:
                              '''Keep your hands clean by rubbing them with an alcohol-based hand sanitizer or by washing them with soap and water.
 Why? Cleaning your hands with soap and water or rubbing them with an alcohol-based hand sanitizer kills viruses that may be on your hands.
/nMaintain at least 1 meter (3 feet) distance between yourself and others.
  Why? When a person coughs or sneezes, they secrete small liquid droplets from their nose or mouth that may contain the virus. If you are too close to him, you can breathe in these droplets, including the virus that causes COVID-19 if that person has it.
/nAvoid crowded places
 Why? When people crowd into crowded places, people who have COVID-19 are more likely to come into contact with someone who has COVID-19 and it is difficult to maintain a distance of 1 meter (3 feet) between you and others.
/nAvoid touching your eyes, nose and mouth.''',
                          assetImage: "assets/images/vaccine.jpg"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center buildAppBar(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 1.h),
        child: Row(
          children: [
            buildButtonBack(context),
            Spacer(),
            Text(
              "Information",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontFamily: "Plex",
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  Widget buildButtonBack(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.all(1.h),
        width: 5.h,
        height: 5.h,
        child: Icon(Icons.arrow_back_ios, color: MColors.covidMain),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({
    Key key,
    @required this.title,
    @required this.description,
    @required this.assetImage,
  }) : super(key: key);
  final String title;
  final String description;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      margin: EdgeInsets.only(bottom: 2.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              // color: Colors.amber,
              color: Colors.grey[200],
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 5))
        ],
        color: Color(0xFFF3F4F5),
        borderRadius: BorderRadius.circular(3.h),

        // border: Border.all()
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 1.h, top: 2.h),
              height: 25.h,
              width: 90.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(assetImage), fit: BoxFit.cover),
                  color: MColors.covidMain,
                  borderRadius: BorderRadius.circular(3.h)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 1.h),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: "Plex",
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 1.h),
            child: Text(
              description,
              textAlign: TextAlign.start,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: "Plex",
                  // fontWeight: FontWeight.bold,
                  fontSize: 14.sp),
            ),
          ),
          SizedBox(
            height: 4.h,
            child: DefaultButton(
              press: () {
                Navigator.pushNamed(context, InfoItemDetailsScreen.routeName,
                    arguments: Info(
                        assetImage: assetImage,
                        description: description,
                        title: title));
              },
              text: "More",
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

class Info {
  String title;
  String description;
  String assetImage;

  Info(
      {@required this.assetImage,
      @required this.description,
      @required this.title});

  List<Info> information = [
    Info(
        assetImage: "assets/images/covid.jpg",
        description:
            "COVID-19 is an infectious disease caused by the last detected strain of coronavirus. There was no knowledge of this new virus and its disease before its outbreak began in the Chinese city of Wuhan in December 2019. COVID-19 has now turned into a pandemic affecting many countries in the world.",
        title: "Whats is COVID-19 ?"),
    Info(
        title: "Covid Mask",
        description:
            '''There is currently no evidence to support or deny the usefulness of wearing masks (medical or other) for healthy people in the community in general. However, the organization is studying the rapidly developing scientific knowledge about masks and constantly updating its guidelines in this regard.
Medical masks are recommended primarily in healthcare facilities, but may be considered for use in other circumstances as well (see below). The use of medical masks should be combined with other key infection prevention and control measures, such as hand hygiene and physical distancing.''',
        assetImage: "assets/images/baby.jpg"),
    Info(
        title: "How to protect myself ?",
        description:
            '''Keep your hands clean by rubbing them with an alcohol-based hand sanitizer or by washing them with soap and water.
 Why? Cleaning your hands with soap and water or rubbing them with an alcohol-based hand sanitizer kills viruses that may be on your hands.
\nMaintain at least 1 meter (3 feet) distance between yourself and others.
  Why? When a person coughs or sneezes, they secrete small liquid droplets from their nose or mouth that may contain the virus. If you are too close to him, you can breathe in these droplets, including the virus that causes COVID-19 if that person has it.
\nAvoid crowded places
 Why? When people crowd into crowded places, people who have COVID-19 are more likely to come into contact with someone who has COVID-19 and it is difficult to maintain a distance of 1 meter (3 feet) between you and others.
\nAvoid touching your eyes, nose and mouth.''',
        assetImage: "assets/images/vaccine.jpg")
  ];
}

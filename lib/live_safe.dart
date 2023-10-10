import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'BusStationCard.dart';
import 'HospitalCard.dart';
import 'PharmacyCard.dart';
import 'PoliceStationCard.dart';

class LiveSafe extends StatelessWidget {
  const LiveSafe({Key? key}) : super(key: key);

  static Future<void> openMap(String location) async {
    String googleUrl = location;

    if (Platform.isAndroid) {
      if (await canLaunchUrl(Uri.parse(googleUrl))) {
        await launchUrl(Uri.parse(googleUrl));
      } else {
        throw 'Could not launch $googleUrl';
      }
    }
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Adjust the height as needed
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 60,),
          Column(

            children: [
              PoliceStationCard(onMapFunction: openMap),
              SizedBox(height: 20,),
              HospitalCard(onMapFunction: openMap),
            ],
          ),
          SizedBox(width: 30,),
          Column(

            children: [
              PharmacyCard(onMapFunction: openMap),
              SizedBox(height: 20,),
              BusStationCard(onMapFunction: openMap),
            ],
          ),
        ],
      ),
    );
  }

}

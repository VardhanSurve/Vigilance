import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'BusStationCard.dart';
import 'HospitalCard.dart';
import 'PharmacyCard.dart';
import 'PoliceStationCard.dart';

class LiveSafe extends StatefulWidget {
  const LiveSafe({Key? key}) : super(key: key);

  static Future<void> openMap(String location) async {
    String googleUrl = location;

    if (Platform.isAndroid) {
      if (await canLaunchUrl(Uri.parse(googleUrl))) {
        await launchUrl(Uri.parse(googleUrl));
      } else {
        throw 'Could not launch $googleUrl';
      }
    } else {
      final Uri _url = Uri.parse(googleUrl);
      try {
        await launchUrl(_url);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  State<LiveSafe> createState() => _LiveSafeState();
}

class _LiveSafeState extends State<LiveSafe> {
  final List<Map<String, String>> emerIcon = [
    {'name': 'Bus Station', 'icons': 'assets/images/buss-removebg-preview.png', 'onpress': 'https://www.google.co.in/maps/search/bus+station+near+me'},
    {'name': 'Hospital', 'icons': 'assets/images/hospital.png', 'onpress': 'https://www.google.co.in/maps/search/hospitals+stations+near+me'},
    {'name': 'Medical', 'icons': 'assets/images/medical store.png', 'onpress': 'https://www.google.co.in/maps/search/pharmacy+stores+near+me'},
    {'name': 'Police Station', 'icons': 'assets/images/police.png', 'onpress': 'https://www.google.co.in/maps/search/police+stations+near+me'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 20.0, // Space between columns
        mainAxisSpacing: 20.0, // Space between rows
        childAspectRatio: 1, // Aspect ratio for each item
      ),
      itemCount: emerIcon.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              LiveSafe.openMap(emerIcon[index]['onpress']!);
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffFFB996),
                    Color(0xffFFB996),
                    Color(0xfffdd8c6),
                    Color(0xffF5F5F5),
                  ],
                ),
               // color: Color(0xffC7ADFF),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xfffcbe94),
                    blurRadius: 7,
                    blurStyle: BlurStyle.normal
                  )
                ],
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Container(
                        //   width: 100,
                        //   height: 100,
                        //   decoration: BoxDecoration(
                        //     color: Color(0xfffcbe94).withOpacity(0.3),
                        //     shape: BoxShape.circle,
                        //   ),
                        // ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: AssetImage(emerIcon[index]['icons']!),
                            fit: BoxFit.cover,
                            width:90,
                          ),
                        ),
                      ],
                    ),
                    Text(emerIcon[index]['name']!,style: TextStyle(
                      fontSize: 15,fontWeight: FontWeight.w500
                    ),)
                  ],
                ),
              ),
            ),
          );
      },
    );
  }
}

import 'package:basic/Notification.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shake/shake.dart';
import 'package:telephony/telephony.dart';
import 'Chat.dart';
import 'sidebar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:floating_navigation_bar/floating_navigation_bar.dart';
//import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'Report.dart';
import 'Location.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
class NavBar extends StatefulWidget {


  @override
  _NavBarState createState() => _NavBarState();
}
Future<String> _getCurrentLocation() async {
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
  LatLng latLng = LatLng(position.latitude, position.longitude);
  double Lat = position.latitude ;
  double Long = position.longitude ;
  String Location = "$Lat+$Long";
  return Location;
}

List<String> numbers = ["9167645691","9529448553","7738657272",""];
class _NavBarState extends State<NavBar> {
  int selectedpage = 0;
  final _pageOptions = [HomePage(),ChatPage(),LocationScreen(),ReportPage(),NotificationPage()];
  late String SmsText;
  @override
  void initState() {
    super.initState();


    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () async {


        String Location = await _getCurrentLocation();
          Telephony telephony = Telephony.instance;
     var number;
     for (number in numbers)
          {

          SmsText='This is An SoS Message My Location is http://maps.google.com/maps?z=12&t=m&q=loc:$Location';
          await telephony.sendSms(
            to: number,
            message: SmsText,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('SOS Sent!'),
            ),
          );
          print(SmsText);
        }

        // Do stuff on phone shake
      },
      minimumShakeCount:1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 15000,
      shakeThresholdGravity: 6,
    );

    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: _pageOptions[selectedpage],
      bottomNavigationBar: CurvedNavigationBar(
        height: screenWidth * 0.15,
        buttonBackgroundColor:const Color(0xff6CC4C0), // bbgcolor[selectedpage],////const Color(0xFF5BEA43),
        backgroundColor:Colors.transparent,// bgcolor[selectedpage],
        color: const Color(0xff37949d),
        animationCurve: Curves.linearToEaseOut,
        items: <Widget>[
          Icon(
            Icons.home,
            size: screenWidth * 0.09,
            color: Colors.black,
          ),
          Icon(
            Icons.chat,
            size: screenWidth * 0.09,
            color: Colors.black,
          ),
          Icon(
            Icons.location_on,
            size: screenWidth * 0.09,
            color: Colors.black,
          ),
          Icon(
            Icons.report,
            size: screenWidth * 0.09,
            color: Colors.black,
          ),
          Icon(
            Icons.edit_notifications_rounded,
            size: screenWidth * 0.09,
            color: Colors.black,
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedpage = index; // changing selected page as per bar index selected by the user
          });
        },
      ),
      // _pageOptions[selectedpage],bottomNavigationBar:


    // SafeArea(
    //   child: FloatingNavigationBar(
    //   backgroundColor: Color(0xff30949D),
    //   barHeight: 80.0,
    //   barWidth: MediaQuery.of(context).size.width - 40.0,
    //   iconColor: Colors.black,
    //   textStyle: TextStyle(
    //     color: Colors.white,
    //     fontSize: 16.0,
    //   ),
    //   iconSize: 25.0,
    //   indicatorColor: Colors.white,
    //   indicatorHeight: 5,
    //   indicatorWidth: 25.0,
    //   items: [
    //
    //     NavBarItems(
    //       icon: Icons.chat_bubble_outlined,
    //       title: "Chat",
    //     ),
    //     NavBarItems(
    //       // icon: EvaIcons.homeOutline,
    //       icon: Icons.my_location,
    //       title: "Maps",
    //     ),
    //     NavBarItems(
    //       icon: Icons.report_gmailerrorred,
    //       title: "Report",
    //     ),
    //
    //     // NavBarItems(
    //     //   icon: Icons.my_location,
    //     //   title: "maps",
    //     // ),
    //   ]
    //   ,
    //     onChanged: (value) {
    //       selectedpage = value;
    //       setState(() {});
    //     },
    //   ),
    // ),
      // Add the Sidebar her
    );
  }
}
import 'package:basic/HomePage/HomePage.dart';
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

List<String> numbers = ["9167645691","9529448553","7738657272","8600646080"];
class _NavBarState extends State<NavBar> {
  int selectedpage = 0;
  final _pageOptions = [HomePages(), ChatPage(), LocationScreen(), ReportPage()];
  late String SmsText;

  @override
  void initState() {
    super.initState();

    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () async {
        try {
          String location = await _getCurrentLocation();
          Telephony telephony = Telephony.instance;

          for (String number in numbers) {
            SmsText = 'This is An SoS Message My Location is http://maps.google.com/maps?z=12&t=m&q=loc:$location';
            await telephony.sendSms(
              to: number,
              message: SmsText,
            );

            // Show success SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('SOS Sent to $number!'),
                backgroundColor: Colors.green,
              ),
            );
          }
        } catch (e) {
          // Show error SnackBar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to send SOS message!'),
              backgroundColor: Colors.red,
            ),
          );
          print('Error sending SMS: $e');
        }
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 15000,
      shakeThresholdGravity: 6,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: _pageOptions[selectedpage],
      bottomNavigationBar: CurvedNavigationBar(
        height: screenWidth * 0.15,
        buttonBackgroundColor: Color(0xff1F3B73),
        backgroundColor: Colors.transparent,
        color: const Color(0xff1F3B73),
        animationCurve: Curves.linearToEaseOut,
        items: <Widget>[
          Icon(
            Icons.home,
            size: screenWidth * 0.09,
            color: Color(0xffFFB996),
          ),
          Icon(
            Icons.chat,
            size: screenWidth * 0.09,
            color: Color(0xffFFB996),
          ),
          Icon(
            Icons.location_on,
            size: screenWidth * 0.09,
            color: Color(0xffFFB996),
          ),
          Icon(
            Icons.report,
            size: screenWidth * 0.09,
            color: Color(0xffFFB996),
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedpage = index;
          });
        },
      ),
    );
  }
}


import 'package:basic/OnboardingSCreen/OnBoardingScreen.dart';
import 'package:basic/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'NavBar.dart';
import 'newOnboarding.dart';
import 'sidebar.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options : DefaultFirebaseOptions.currentPlatform,
  );
  runApp(SidebarApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/Welcome', // Set the initial route
      // routes: {
      //   '/Welcome': (context) =>
      //       WelcomeScreen(), // Welcome screen as the initial route
      //   '/Login': (context) => LoginPage(), // Define your login page
      //   '/Signup': (context) => SignupScreen(), // Define your signup page
      // },
    );
  }
}



class SidebarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       initialRoute: '/intro', // Set the initial route
       routes: {
         '/intro': (context) => OnboardingScreen(),
          // Welcome screen as the initial route
          // Define your login page
         '/Signup': (context) => SignupScreen(), // Define your signup page
       },
      debugShowCheckedModeBanner: false,
      home:
      NewOnBoardingScreen(),


    );
  }
}


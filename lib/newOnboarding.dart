import 'package:basic/Home.dart';
import 'package:basic/NavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'FirebaseAuth.dart';
import 'model/onboardingModel.dart';
import 'Location.dart';
class NewOnBoardingScreen extends StatefulWidget {
  const NewOnBoardingScreen({super.key});
  static const String id = "onboarding screen";


  @override
  State<NewOnBoardingScreen> createState() => _NewOnBoardingScreenState();
}

class _NewOnBoardingScreenState extends State<NewOnBoardingScreen> {
  List<Widget> getPages() {
    return [
      const OnBoardingModelPageViewModel(
        imgUrl: "assets/images/708003cc0c717bfa933ca2937b6153f2.jpg",
        modelTitle: "Maps: Navigate with Confidence",
        modelDesc: "Navigate through your surroundings with ease and confidence",
      ),
      const OnBoardingModelPageViewModel(
        imgUrl: "assets/images/611abb174fca272b4729a6512ecab48d.jpg",
        modelTitle: "Instant Contact with Emergency Services",
        modelDesc: "Reach out for assistance, provide crucial information, and receive immediate guidance to help you through any distressing situation.",
      ),
      const OnBoardingModelPageViewModel(
        modelTitle: "Emergency Alert Button",
        modelDesc: "Reach out for assistance, provide crucial information, and receive immediate guidance to help you through any distressing situation.",
        imgUrl : "assets/images/alert.jpg",
      ),
      const OnBoardingModelPageViewModel(
        imgUrl: "assets/images/community.png",
        modelTitle: "A Collaborative Approach to Safety",
        modelDesc: "The community watch feature allows you to contribute to the safety of others by rating and assessing the safety of different locations",
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
        rawPages: getPages(),
          onDone: () =>{ Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>NavBar(),))
            ,
            AnonymousSignup()

          },
          showSkipButton: false,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: false,
          showDoneButton: true,
          back: const Icon(Icons.arrow_back,color: Color(0xff30949D)),
          skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff30949D))),
          next: const Icon(Icons.arrow_forward,color: Color(0xffff6b81),size: 35,),
          done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff30949D),fontSize: 25)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: kIsWeb
              ? const EdgeInsets.all(12.0)
              : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(12.0, 12.0),
            color: Color(0xfff6b4bb),
            activeSize: Size(26.0, 12.0),
            activeColor: Color(0xff30949D),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}

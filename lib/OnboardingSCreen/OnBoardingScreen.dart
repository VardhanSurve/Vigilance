import 'package:basic/NavBar.dart';
import 'package:basic/OnboardingSCreen/OnBOardingSize.dart';
import 'package:basic/OnboardingSCreen/OnBoardingContent.dart';
import 'package:basic/compo/ElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;

  // Define gradients for each page
  List<LinearGradient> pageGradients = [
    LinearGradient(
      colors: [Color(0xffF5F5F5), Color(0xffF5F5F5)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Color(0xffF5F5F5), Color(0xffF5F5F5)],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
    LinearGradient(
      colors: [Color(0xffF5F5F5), Color(0xffF5F5F5)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: _currentPage == index ? Color(0xff1F3B73) : Color(0xff39A8A0).withOpacity(0.5),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 30 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: _controller,
          onPageChanged: (value) => setState(() => _currentPage = value),
          itemCount: contents.length,
          itemBuilder: (context, i) {
            return Container(
              decoration: BoxDecoration(
                gradient: pageGradients[i],
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Image.asset(
                      contents[i].image,
                      height: SizeConfig.blockV! * 45,
                    ),
                    SizedBox(
                      height: (height >= 840) ? 10 : 0,
                    ),
                    Text(
                      contents[i].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Mulish",
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w800,
                        fontSize: (width <= 550) ? 35 : 40,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      contents[i].desc,
                      style: TextStyle(
                        fontFamily: "Mulish",
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w300,
                        fontSize: (width <= 550) ? 17 : 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomSheet: Container(
        color: Color(0xffF5F5F5), // Set the background color of the bottom sheet to black
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Page indicator outside of the bottomSheet container
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                      (int index) => _buildDots(index: index),
                ),
              ),
            ),
            // BottomSheet content with adjusted colors
            _currentPage + 1 == contents.length
                ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              child: CustomElevatedButton(
                title: "START",
                color1: Color(0xff1F3B73),
                color2: Color(0xff5476b0),
                padh: 100,
                padv: 20,
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => NavBar(),
                    ),
                  );
                },
              ),
            )
                : Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text(
                      "SKIP",
                      style: TextStyle(color: Color(0xff39A8A0)), // Set text color to white for visibility
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Color(0xff39A8A0)), // Set border color to white
                      ),
                      elevation: 0,
                      padding: (width <= 550)
                          ? const EdgeInsets.symmetric(horizontal: 30, vertical: 15)
                          : const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: (width <= 550) ? 17 : 17,
                      ),
                    ),
                  ),
                  CustomElevatedButton(
                    title: "NEXT",
                    color1: Color(0xff1F3B73),
                    color2: Color(0xff5476b0),
                    padh: 27,
                    padv: 15,
                    onPressed: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}

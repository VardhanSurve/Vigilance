import 'package:basic/Profile/profilePagee.dart';
import 'package:basic/ProfilePage.dart';
import 'package:basic/live_safe.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        title: Text("AROGYA",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: GestureDetector(
                onTap: () {
                  //Navigator.push(
                   // context,
                    //MaterialPageRoute(builder: (context) => EditProfile()),
                 // );
                },
                child: Container(
                  height: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    // color: Color(0xFFA4BFA7),
                    // Background color red
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xfff6b4bb), // Light pink
                        Color(0xff37949d), // Dark teal
                        Color(0xff37949d), // Dark teal
                        Color(0xff37949d), // Dark teal
                        Color(0xff37949d), // Dark teal
                        Color(0xff37949d), // Dark teal
                      ], // Gradient from https://learnui.design/tools/gradient-generator.html
                      tileMode: TileMode.mirror,
                    ),
                    borderRadius: BorderRadius.circular(20), // Border radius
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Center(
                              child: Image(
                                fit: BoxFit.cover,
                                image:AssetImage('assets/images/708003cc0c717bfa933ca2937b6153f2.jpg'),
                                height: 120,
                                width: 120,
                              ),
                            ),
                          ),
                        ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10,),
                         Text(
                            "Lady Gaga",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: Colors.white),
                          ),
                         Text(
                            "gaga@gmail.com",
                            style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(width: 40,),
                      IconButton(onPressed: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ProfilePagee(),
                          ),
                        );
                      }, icon: Icon(Icons.edit,size: 30,))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Open link for the first image
                          launch('https://www.nationalgeographic.com/travel/article/should-women-travel-solo-india-tips');
                        },
                        child: Container(
                          width: 330, // Set this width to match the width of your image
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(22.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF4E7D7A).withOpacity(0.4), // Desaturated teal with 20% opacity
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          margin: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Stack(
                              children: [
                                Image.asset('assets/images/NYC subway.jpeg', width: 330, fit: BoxFit.cover),
                                Positioned(
                                  bottom: 8.0,
                                  left: 8.0,
                                  child: Text(
                                    'Road Safety Articles',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Open link for the first image
                          launch('https://seniority.in/blog/post/womens-safety-self-defense-tips-and-why-is-it-important');
                        },
                        child: Container(
                          width: 330,
                          decoration: BoxDecoration(
                            color: Color(0xFF597934),
                            border: Border.all(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF4E7D7A).withOpacity(0.4), // Desaturated teal with 20% opacity
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          margin: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Stack(
                              children: [
                                Image.asset('assets/images/sd1.jpg',width: 330, fit: BoxFit.fill),
                                Positioned(
                                  bottom: 8.0,
                                  left: 8.0,
                                  child: Text(
                                    'Self Defence Techniques',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Open link for the first image
                          launch('https://www.realsimple.com/health/preventative-health/safety/4-essential-self-defense-moves-everyone-should-know');
                        },
                        child: Container(
                          width: 330,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF4E7D7A).withOpacity(0.4), // Desaturated teal with 20% opacity
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          margin: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Stack(
                              children: [
                                Image.asset('assets/images/Top 10 Health Benefits of Martial Arts.jpeg',width: 330, fit: BoxFit.fill),
                                Positioned(
                                  bottom: 8.0,
                                  left: 8.0,
                                  child: Text(
                                    'Things To Know While Travelling Alone',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Padding(
                padding:EdgeInsets.only(left: 20),
                child: Text("Nearby Locations",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),)),
            SizedBox(height:0,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LiveSafe(),
            ),
          ],
        ),
      ),
    );
  }
}

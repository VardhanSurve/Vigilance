import 'package:basic/Profile/profilePagee.dart';
import 'package:basic/ProfilePage.dart';
import 'package:basic/live_safe.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});
// Function to build category cards
  Widget _buildCategoryCard(String title,Color bgcolor, Color color, String iconPath) {
    return Container(
      margin: EdgeInsets.only(right: 10, top: 10, bottom: 9),
      padding: EdgeInsets.all(15),
      width: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xffF76A6A).withOpacity(0.5),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: bgcolor.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
              Image.asset(iconPath, height: 70, width: 70),
            ],
          ),
          SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffF5F5F5) ,

      // appBar: AppBar(
      //   automaticallyImplyLeading:false,
      //   centerTitle: true,
      //   title: Text("VIGILANCE",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
      //
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
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
                        Color(0xffFFB996), // Light pink
                        Color(0xfffdc2a4), // Dark teal
                        Color(0xfffdd0b7), // Dark teal
                        Color(0xffffddcd), // Dark teal
                        Color(0xffffe8dc), // Dark teal
                        Color(0xffffe9df), // Dark teal
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
                            "Shobha Verma",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: Color(0xff2D2D2D)),
                          ),
                         Text(
                            "shobha231@gmail.com",
                            style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xff2D2D2D)),
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
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Open link for the first image
                          launch('https://www.nationalgeographic.com/travel/article/should-women-travel-solo-india-tips');
                        },
                        child: Container(
                          width: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF4E7D7A).withOpacity(0.6),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          margin: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Stack(
                              children: [
                                Image.asset('assets/images/back.jpg', width: 330, fit: BoxFit.cover),
                                Positioned(
                                  top: 78.0,
                                  left: 8.0,
                                  child: Text(
                                    'Road Safety Articles',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 8.0,
                                  bottom: 8.0,
                                  child: Image.asset('assets/images/09824ced6749eb491058ae4d8f9c37ba-removebg-preview.png', width: 150, height: 150),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Open link for the second image
                          launch('https://seniority.in/blog/post/womens-safety-self-defense-tips-and-why-is-it-important');
                        },
                        child: Container(
                          width: 330,
                          decoration: BoxDecoration(
                            color: Color(0xFF597934),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF4E7D7A).withOpacity(0.6),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          margin: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Stack(
                              children: [
                                Image.asset('assets/images/back.jpg', width: 330, fit: BoxFit.fill),
                                Positioned(
                                  top: 58.0,
                                  left: 8.0,
                                  child: Text(
                                    'Self Defence \n Techniques',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 8.0,
                                  bottom: 8.0,
                                  child: Image.asset('assets/images/9bb4f8aadda67a3a811808bc7fbafa5a-removebg-preview.png', width: 150, height: 150),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Open link for the third image
                          launch('https://www.realsimple.com/health/preventative-health/safety/4-essential-self-defense-moves-everyone-should-know');
                        },
                        child: Container(
                          width: 330,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF4E7D7A).withOpacity(0.6),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          margin: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Stack(
                              children: [
                                Image.asset('assets/images/back.jpg', width: 330, fit: BoxFit.fill),
                                Positioned(
                                  top: 68.0,
                                  left: 8.0,
                                  child: Text(
                                    'Things To Know \n While Travelling Alone',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 1.0,
                                  bottom: 8.0,
                                  child: Image.asset('assets/images/30cc0d8b6b74da55b4f343dd0a57bc8b-removebg-preview.png', width: 150, height: 150),
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
          // Add this section above "Nearby Locations"

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All Services",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryCard('Call',Colors.blue.shade200, Color(0xffFFB996), 'assets/images/abfd8a887e07a253f62ce1e546780ba4-removebg-preview.png'),
                      _buildCategoryCard('Alert',Colors.red.shade200, Color(0xffFFB996), 'assets/images/alert.png'),
                      _buildCategoryCard('Chat',Colors.orange.shade200, Color(0xffFFB996), 'assets/images/maps.png'),
                      _buildCategoryCard('Others',Colors.green.shade300, Color(0xffFFB996), 'assets/images/e9b76cbacdb9907afea485da6860692b-removebg-preview.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),

      SizedBox(height: 5,),
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

import 'package:basic/CustomCarouel.dart';
import 'package:basic/NavBar.dart';
import 'package:basic/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'Report.dart';
import 'Location.dart';
import 'live_safe.dart';
import 'quotes.dart';
import 'sidebar.dart';

import 'package:horizontal_list_view/horizontal_list_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

void main() {
  runApp(SidebarApp());

}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final List<String> items = [
    "Know the human body's weak points",
    "Rotate your wrists to free your hands",
    "Drop low if you're grabbed from behind",
    "Focus on the thumbs if you're being choke",
  ];
  String? selectedValue;

  final List<String> drop = [
    'Plan travel in advance',
    "Don't blindly trust strangers",
    "Keep your self defence ready",
    "During Night travel keep your friend updated",
  ];
  String? dropValue;
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      drawer: Sidebar(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 900,
          color: Color(0xffF2F2F2),
          child:Stack(
          children:[
            //  Image.asset(
            //   'assets/images/download (1).jpeg',
            //    height: MediaQuery.of(context).size.height,
            //    width: 900,
            //   fit: BoxFit.fill,
            // ),
             Stack(
              children: [
                Positioned(
                  top:45,
                  right: 20,
                  child: Builder(
                    builder: (context) => IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(Icons.person, size: screenWidth * 0.11,color: Color(0xffff6b81),),
                    ),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 13.0,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                ),
                  Positioned(
                      top: 60,
                      left: 100,
                      child: Container(
                        child: Text(
                          "SAFE-ROUTES",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xff007A78),
                            //color: Color(0xff37949d),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                  )
                  ),

                Positioned(
                  top: 135,
                  left: 5,
                  right: 0,
                  child: Container(
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
                ),
                Positioned(
                    top:430,
                    left: 20,
                    right: 20,
                    child:DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: const Row(
                          children: [
                            Icon(
                              Icons.list,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Safety Tips ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: items
                            .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff333333),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            //selectedValue = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          width: 300,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color(0xffff6b81),
                          ),
                          elevation: 6,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_downward_outlined,
                            size: 30,
                          ),
                          iconSize: 30,
                          iconEnabledColor: Colors.white,
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: 350,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                             color: Color(0xffeca0ac),
                          ),
                          //offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all(6),
                            thumbVisibility: MaterialStateProperty.all(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ), ),

                Positioned(
                  top:500,
                  left: 20,
                  right: 20,
                  child:DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Row(
                        children: [
                          Icon(
                            Icons.list,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Tips For Travelling ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: drop
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff333333),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                          .toList(),
                      value: dropValue,
                      onChanged: (value) {
                        setState(() {
                          //dropValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        width: 300,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          // border: Border.all(
                          //   color: Colors.black26,
                          // ),
                          color: const Color(0xffff6b81),
                        ),
                        elevation: 6,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_downward_outlined,
                        ),
                        iconSize: 30,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 350,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color(0xffeca0ac),
                        ),
                        //offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ),

                Positioned(
                    top: 575,
                    child: LiveSafe()),

                // Container(
                    //   height: 100,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     children: [
                    //       Container(
                    //         child: HospitalCard() ,
                    //       ),
                    //       Container(
                    //         child: BusStationCard(),
                    //       ),
                    //       Container(
                    //         child: PharmacyCard(),
                    //       ),
                    //       Container(
                    //         child: PoliceStationCard(),
                    //       ),
                    //     ],
                    //   ),
                    // ),







            /*Positioned(
                  top: 80.0, // Adjust the position as needed
                  left: screenWidth * 0.65, // Adjust the position as needed
                  child: Text(
                    "Agent",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),*/
                // Positioned(
                //   top: 590,
                //   left: 20,
                //   child: Container(
                //     width: 325,
                //     height: 670,
                //     decoration: BoxDecoration(
                //       border: Border.all(color: Colors.black, width: 2.0),
                //       borderRadius: BorderRadius.circular(20),
                //       color: Color.fromRGBO(133, 207, 210, 0.5),
                //     ),
                //     padding: EdgeInsets.all(20),
                //     // Blue color with 50% opacity
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Container(
                //           width: double.infinity,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20),
                //             color: Color(0xff65bfc5),
                //           ),
                //           padding: EdgeInsets.all(10),
                //           margin: EdgeInsets.only(bottom: 20),
                //           child: Text(
                //             '  ➤   SafeRoute gives you analysis of safety rate(SAFE / UNSAFE / NEUTRAL) of road at which you are travelling ',
                //             style: TextStyle(color: Colors.black, fontSize: 17),
                //           ),
                //         ),
                //         Container(
                //           width: double.infinity,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20),
                //             color: Color(0xff65bfc5),
                //           ),
                //           padding: EdgeInsets.all(10),
                //           margin: EdgeInsets.only(bottom: 20),
                //           child: Text(
                //             '  ➤   Integrated chatbot named ORIGIN is their to be your companion till you reach your destination safely.',
                //             style: TextStyle(color: Colors.black, fontSize: 17),
                //           ),
                //         ),
                //         Container(
                //           width: double.infinity,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20),
                //             color: Color(0xff65bfc5),
                //           ),
                //           padding: EdgeInsets.all(10),
                //           margin: EdgeInsets.only(bottom: 20),
                //           child: Text(
                //             '  ➤   emergency sos will be sent to your guradians and emergency services on shake of phone.',
                //             style: TextStyle(color: Colors.black, fontSize: 17),
                //           ),
                //         ),
                //         Container(
                //           width: double.infinity,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20),
                //             color: Color(0xff65bfc5),
                //           ),
                //           padding: EdgeInsets.all(10),
                //           margin: EdgeInsets.only(bottom: 20),
                //           child: Text(
                //             '  ➤   your live location is fetched and based on that nearby police station, hospitals, pharmacies and public transport is spotted on map.',
                //             style: TextStyle(color: Colors.black, fontSize: 17),
                //           ),
                //         ),
                //         Container(
                //           width: double.infinity,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20),
                //             color: Color(0xff65bfc5),
                //           ),
                //           padding: EdgeInsets.all(10),
                //           child: Text(
                //             '  ➤    live incidents reporting system is provided, so that any other anonyms person can also compliant about the incident to the official authorities.',
                //             style: TextStyle(color: Colors.black, fontSize: 17),
                //           ),
                //         ),
                //
                //
                //       ],
                //     ),
                //   ),
                // ),

              ],
            ),
          ],
      ),
        ),
      ),
    );
  }
}


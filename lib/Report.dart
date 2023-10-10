import 'package:basic/BusStationCard.dart';
import 'package:basic/HospitalCard.dart';
import 'package:basic/live_safe.dart';
import 'package:basic/policeemergency.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
import 'AmbulanceEmergency.dart';
import 'FirebrigadeEmergency.dart';
import 'WomenSafety.dart';
import 'PharmacyCard.dart';
import 'PoliceStationCard.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:url_launcher/url_launcher.dart';
class ReportPage extends StatefulWidget {

  @override
  _ReportPageState createState() => _ReportPageState();
}
class _ReportPageState extends State<ReportPage> {
  String ReportNow ="Harassment at Aray road near Goragaon";
  final List<String> items = [
    "https://morth.nic.in/public-grievances",
    "https://sakhi.gov.in/home/resources",
    "https://citizen.mahapolice.gov.in/Citizen/MH/Women.aspx",
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
          Container(
            width: double.infinity,
            height: 900,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/download (1).jpeg'), // Path to your image
                fit: BoxFit.cover,
              ),
            ),

            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                      child: SizedBox(
                        height: 300,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                                child: PoliceEmergency()
                            ),
                            Container(
                                child:AmbulanceEmergency ()
                            ),
                            Container(
                                child:FirebrigadeEmergency ()
                            ),
                            Container(
                                child:WomenSafety ()
                            ),

                          ],
                        ),
                      ),
                    ),
                ),
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
                SizedBox(height: 10,),
                Container(
                  child: LiveSafe(),
                ),
                SizedBox(height: 10,),
                Positioned(
                  top:430,
                  left: 20,
                  right: 20,
                  child:DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint:  Row(
                        children: [
                          Image.asset(
                            'assets/images/goverment (1).png', // Replace with the actual path to your icon
                            width: 60,
                            height: 60,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 0,
                          ),
                          Expanded(
                            child: Text(
                              'Complaint To Government Officals',
                              style: TextStyle(
                                fontSize: 15,
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
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                        if (value != null) {
                          launch(value);
                        }
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        width: 320,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xffff6b81),
                        ),
                        elevation: 2,
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
                        width: 320,
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
                SizedBox(height: 20,),
                ListTile(
                  title: Column(
                    children: [
                      Text(
                        'REPORT LIVE INCIDENTS:',
                        style: TextStyle(
                          color:Color(0xff06535b),
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 16.0,height: 10,),
                      Container(
                        width: 370,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xffb2e9f1),
                          border: Border.all(
                            color: Color(0xff06535b),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            ReportNow,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      SizedBox(
                        width: 90,
                        child: ElevatedButton(
                          onPressed: () async {
                            Telephony telephony = Telephony.instance;

                            await telephony.sendSms(
                              to:"9167645691", //"8424820665",
                              message: ReportNow,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('SOS Sent!'),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 16,color: Color(0xfff6b4bb),),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff37949d), // Updated color to pink
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Rounded corners
                              side: BorderSide(color: Color(0xfff6b4bb),), // Border color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

            ),
          ),
        ],
        ),
      )
    );
  }
}
import 'package:basic/BusStationCard.dart';
import 'package:basic/HospitalCard.dart';
import 'package:basic/live_safe.dart';
import 'package:basic/policeemergency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
import 'AmbulanceEmergency.dart';
import 'FirebrigadeEmergency.dart';
import 'WomenSafety.dart';
import 'PharmacyCard.dart';
import 'PoliceStationCard.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}
class _ReportPageState extends State<ReportPage> {
  List<String> notifications = [];
  List<String> descriptionlist = [];
  String ReportNow ="Harassment at Aray road near Goragaon";
  final List<String> items = [
    "https://morth.nic.in/public-grievances",
    "https://sakhi.gov.in/home/resources",
    "https://citizen.mahapolice.gov.in/Citizen/MH/Women.aspx",
  ];
  void addNotification(String message, String description) {
    setState(() {
      notifications.insert(0, message);
      descriptionlist.insert(0, description);
      // Add the latest notification at the beginning of the list
    });
  }
  File? selectedImage;
  TextEditingController incidentName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController reportNow = TextEditingController();
  Future openDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Color(0xffF5F5F5),
      title: Text(
        "Enter Incident Details",
        style: TextStyle(
          color: Color(0xff2D2D2D),
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30),
                TextField(
                  autofocus: true,
                  controller: incidentName,
                  decoration: InputDecoration(
                    hintText: "Incident Title",
                    filled: true,
                    fillColor: Colors.teal.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: description,
                  decoration: InputDecoration(
                    hintText: "Description",
                    filled: true,
                    fillColor: Colors.teal.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        pickImagefromGallery(setState);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.photo,
                            color: Color(0xff2D2D2D),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Gallery",
                            style: TextStyle(
                              color: Color(0xff2D2D2D),
                            ),
                          ),
                        ],
                      ),
                      color: Color(0xffFF6F61),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 10),
                    MaterialButton(
                      onPressed: () {
                        pickImagefromCamera(setState);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: Color(0xff2D2D2D),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Camera",
                            style: TextStyle(
                              color: Color(0xff2D2D2D),
                            ),
                          ),
                        ],
                      ),
                      color: Color(0xffFF6F61),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                selectedImage != null
                    ? Container(
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green, width: 2.0),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Image Selected",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )
                    : Text(
                  "Select an Image",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Color(0xff333333),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () async {
            final List<String> phoneNumbers = [
              "9167645691",
              "9529448553",
              "7738657272",
              "8600646080"
            ];

            Telephony telephony = Telephony.instance;

            for (String number in phoneNumbers) {
              try {
                await telephony.sendSms(
                  to: number,
                  message: '${incidentName.text}: ${description.text}',
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Message sent to $number'),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error sending message to $number'),
                  ),
                );
              }
            }

            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white),
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color(0xff39A8A0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    ),
  );

  Future pickImagefromGallery(StateSetter setState) async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }

  Future pickImagefromCamera(StateSetter setState) async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }


  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor:Color(0xffF5F5F5),
        //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
          Container(
            width: double.infinity,
            height: 900,
            color: Color(0xffF5F5F5),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/download (1).jpeg'), // Path to your image
            //     fit: BoxFit.cover,
            //   ),
            // ),

            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
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

                SizedBox(height: 35,),
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
                              'Report To Government Officals',
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
                            color: Color(0xff333333),
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
                          color: const Color(0xff1F3B73),
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
                          color: Color(0xffFB9280),
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
                SizedBox(height: 15,),
                ListTile(
                  title: Column(
                    children: [
                      Text(
                        'REPORT LIVE INCIDENTS:',
                        style: TextStyle(
                          color:Color(0xff2D2D2D),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 16.0,height: 7,),
                      // Container(
                      //   width: 370,
                      //   height: 100,
                      //   decoration: BoxDecoration(
                      //     color: Color(0xffb2e9f1),
                      //     border: Border.all(
                      //       color: Color(0xff06535b),
                      //       width: 2.0,
                      //     ),
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: Center(
                      //     child: Text(
                      //       reportNow.text,
                      //       style: TextStyle(
                      //         color: Color(0xff333333),
                      //         fontSize: 15,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      TextField(
                        controller: reportNow,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Describe your emergency...',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                          labelText: 'Emergency Report',
                          labelStyle: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1
                            ),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                        style: TextStyle(
                          fontSize: 16
                        ),
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (reportNow.text.isNotEmpty) {
                              Telephony telephony = Telephony.instance;

                              await telephony.sendSms(
                                to: "9167645691", //"8424820665",
                                message: reportNow.text,
                              );

                              reportNow.clear();

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('SOS Sent!'),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter a message before sending.'),
                                ),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 16,color: Color(0xff2D2D2D),),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff39A8A0), // Updated color to pink
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Rounded corners
                              side: BorderSide(color: Color(0xff39A8A0),), // Border color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        openDialog();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffFFB996),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add, color: Colors.grey.shade200,size: 40,),
                            onPressed: () {
                              openDialog();
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width -
                                40, // Screen width minus 20 on both sides
                            color: Colors
                                .white, // Set the white color for the "notification pad"
                            margin: EdgeInsets.only(
                                bottom: 10.0), // Add margin between notifications
                            child: Column(
                              children: [
                                Text(notifications[index],style: TextStyle(fontSize: 20),),
                                Text(descriptionlist[index],style: TextStyle(fontSize: 10))
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
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
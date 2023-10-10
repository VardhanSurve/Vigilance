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
  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xffeeb9c2),
        title: Text("Enter Incident Details",
        style: TextStyle(
          color: Color(0xff007A78),
          fontWeight: FontWeight.bold,
          fontSize: 25
        ),),
        content: Container(
          child: Column(
            children: [
              SizedBox(height: 30,),
              TextField(
                autofocus: true,
                controller: incidentName,
                decoration: InputDecoration(
                  hintText: "Incident Title",
                  filled: true,
                  fillColor: Colors.teal.withOpacity(0.3),
                  // Teal color with some transparency for a subtle background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners for a modern look
                    borderSide: BorderSide(
                      color: Colors.green, // Border color set to teal
                      width: 2.0, // Border width
                    ),
                    // Remove the border to create a clean appearance
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: description,
                decoration: InputDecoration(hintText: "Description",filled: true,
                  fillColor: Colors.teal.withOpacity(0.3), // Teal color with some transparency for a subtle background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners for a modern look
                    borderSide: BorderSide(
                      color: Colors.green, // Border color set to teal
                      width: 2.0, // Border width
                    ), // Remove the border to create a clean appearance
                  ),),
              ),
              SizedBox(height: 20,),
              MaterialButton(
                onPressed: () {
                  pickImagefromGallery();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.photo, // Example icon (you can replace with the desired icon)
                      color: Colors.white, // Icon color in white
                    ),
                    SizedBox(width: 8), // Add some spacing between the icon and text
                    Text(
                      "Gallery",
                      style: TextStyle(
                        color: Colors.white, // Text color in white for better visibility
                      ),
                    ),
                  ],
                ),
                color: Color(0xff4db2af), // Teal color for the button background
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners for a modern look
                ),
              ),


              MaterialButton(
                onPressed: () {
                  pickImagefromCamera();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.camera_alt, // Example camera icon (you can replace with the desired camera icon)
                      color: Colors.white, // Icon color in white
                    ),
                    SizedBox(width: 8), // Add some spacing between the icon and text
                    Text(
                      "Camera",
                      style: TextStyle(
                        color: Colors.white, // Text color in white for better visibility
                      ),
                    ),
                  ],
                ),
                color: Color(0xFFFF6B81),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              selectedImage != null
                  ? Image.file(
                selectedImage!,
                height: 79,
              )
                  : Text("Select an Image ",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Color(0xff333333),
                fontSize: 20,
              ),)
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                addNotification(incidentName.text, description.text);
                Navigator.of(context).pop();
              },
              child: Text("Submit",
              style: TextStyle(
                color: Colors.white
              ),),
    style: TextButton.styleFrom(
  backgroundColor: Color(0xff007A78), // Pink color for the button background
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Rounded corners for a modern look
    ),
  ),)
        ],
      ));
  Future pickImagefromGallery() async {
    final returnedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    // if(returnedImage==null)return;
    setState(() {
      selectedImage = File(returnedImage!.path);
    });
  }

  Future pickImagefromCamera() async {
    final returnedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    // if(returnedImage==null) return;
    setState(() {
      selectedImage = File(returnedImage!.path);
    });
  }

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
            color: Color(0xffF2F2F2),
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
                SizedBox(height: 35,),
                ListTile(
                  title: Column(
                    children: [
                      Text(
                        'REPORT LIVE INCIDENTS:',
                        style: TextStyle(
                          color:Color(0xff06535b),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 16.0,height: 7,),
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
                              color: Color(0xff333333),
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
                SizedBox(height: 30,),
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
                            color: Color(0xffff6b81),
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
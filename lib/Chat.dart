import 'package:basic/NavBar.dart';
import 'package:basic/chatbot.dart';
import 'package:basic/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final List<String> contacts = ["9529448553","9167645691","7738657272","8600646080","8356860310"];
  final List<String> relations = ["Harshavardhan","Pritesh","Aryan","Sharib","Varun"];

  void addItemToList(){
    setState(() {
      relations.insert(0,nameController.text);
      contacts.insert(0,numberController.text);
    });
  }
  @override
  Widget build(BuildContext context) {




    final screenWidth = MediaQuery.of(context).size.width;
    Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Color(0xffeeb9c2),
              title: Text("Enter Contact Details",
                style: TextStyle(
                  color: Color(0xff007A78),
            fontWeight: FontWeight.bold,
            fontSize: 25
        ),),
              content: Container(
                height: 150,
                child: Column(
                  children: [
                    TextField(
                      autofocus: true,
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Enter Contact Name",
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
                    SizedBox(height: 20,),
                    TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        hintText: "Enter Contact No.",
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
                    )
                  ],
                ),
              ),
              actions: [TextButton(
                  onPressed: () {
                addItemToList();
                Navigator.of(context).pop();
              },
                child: Text("Submit",
                  style: TextStyle(
                      color: Colors.white
                  ),
              ),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff007A78), // Pink color for the button background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners for a modern look
                  ),
                ),
              ),
              ],
            ));
    return Scaffold(
        extendBody: true,
       //backgroundColor:Color(0xff37949d),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/download.jpeg',
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                Container(height: 40,color: Color(0xff007A78)),
                Container(
                  color:Color(0xff007A78),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffFF6B81),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.add,
                                  color:Colors.white,// Color(0xff37949d),
                              size: 40,),
                              onPressed: () {
                                openDialog();
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        child: VerticalDivider(
                          color: Colors.white,
                          width: 15,
                          thickness: 1,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.all(0),
                            height: 100,
                            child: ListView.builder(
                                padding: EdgeInsets.all(15),
                                scrollDirection: Axis.horizontal,
                                itemCount: relations.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => _callNumber(contacts[index]),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 54,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/avatar.png")),
                                          ),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Icon(
                                                Icons.call,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            relations[index],
                                            style: TextStyle(fontSize: 11,
                                            color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                  ;
                                })),
                      ),
                    ],
                  ),
                ),
                ChatBot()
              ],
            ),
          ],
        ));
  }
}

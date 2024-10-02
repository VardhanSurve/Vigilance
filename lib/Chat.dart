import 'package:basic/NavBar.dart';
import 'package:basic/chatbot.dart';
import 'package:basic/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // Needed for encoding/decoding JSON

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  List<String> contacts = [];
  List<String> relations = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  // Load contacts from shared preferences
  Future<void> _loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      contacts = prefs.getStringList('contacts') ?? [];
      relations = prefs.getStringList('relations') ?? [];
    });
  }

  // Save contacts to shared preferences
  Future<void> _saveContacts() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('contacts', contacts);
    prefs.setStringList('relations', relations);
  }

  void addItemToList() {
    setState(() {
      relations.insert(0, nameController.text);
      contacts.insert(0, numberController.text);
      nameController.clear();  // Clear the name text field
      numberController.clear();  // Clear the number text field
    });
    _saveContacts(); // Save to cache
  }

  Future openDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white70,
      title: Text(
        "Enter Contact Details",
        style: TextStyle(
          color: Color(0xff2D2D2D),
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
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
            TextField(
              controller: numberController,
              decoration: InputDecoration(
                hintText: "Enter Contact No.",
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
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            addItemToList();
            Navigator.of(context).pop();
          },
          child: Text(
            "Submit",
            style: TextStyle(
              color: Color(0xff2D2D2D),
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/download.jpeg',
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Container(height: 40, color: Color(0xff1F3B73)),
              Container(
                color: Color(0xff1F3B73),
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
                            color: Color(0xffFF6F61),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 40,
                            ),
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
                        color: Color(0xffF5F5F5),
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
                                            "assets/images/avatar.png"),
                                      ),
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
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Color(0xffF5F5F5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ChatBot(),
            ],
          ),
        ],
      ),
    );
  }
}

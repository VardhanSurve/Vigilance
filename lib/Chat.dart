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
              title: Text("Enter Contact Details"),
              content: Container(
                height: 100,
                child: Column(
                  children: [
                    TextField(
                      autofocus: true,
                      controller: nameController,
                      decoration:
                          InputDecoration(hintText: "Enter Contact Name"),
                    ),
                    TextField(
                      controller: numberController,
                      decoration:
                          InputDecoration(hintText: "Enter Contact No."),
                    )
                  ],
                ),
              ),
              actions: [TextButton(onPressed: () {
                addItemToList();
                Navigator.of(context).pop();
              }, child: Text("Submit"))],
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
                Container(height: 50,color: Color(0xff67c2cb)),
                Container(
                  color:Color(0xff67c2cb),
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
                              color: Colors.grey.shade200,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.add,
                                  color: Color(0xff37949d),
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
                                            style: TextStyle(fontSize: 11),
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

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:basic/ChatMessages.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});


  @override
  State<ChatBot> createState() => _ChatBotState();
}



class _ChatBotState extends State<ChatBot> {
  List<Map<String, dynamic>> intents = [];
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }
  final TextEditingController _messagecontroller = TextEditingController();
  final List<ChatMessages> _messages =[];


  Future<void> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/chat.json');
    print("loaded");
    setState(() {
      Map<String, dynamic> jsonData = json.decode(jsonString);
      intents = List<Map<String, dynamic>>.from(jsonData['intents']);
    });
  }
  String chatbotResponse(String userInput) {
    for (var intent in intents) {
      if (intent['patterns'].contains(userInput)) {
        dynamic responses = intent['responses'];
        if (responses is List<dynamic>) {
          return responses[(responses.length * (Random().nextDouble())).toInt()].toString();
        }
      }
    }
    return "Sorry, I didn't understand that.";
  }



  void _sendMessage(){
    String prompt = _messagecontroller.text;
    ChatMessages _message = ChatMessages(text: prompt, sender: "you");

    setState(() {
    _messages.insert(0, _message);
  });

  _messagecontroller.clear();

  ChatMessages _botmessage = ChatMessages(text: chatbotResponse(prompt), sender: "origin");
  setState(() {
    _messages.insert(0, _botmessage);
  });
}


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 660,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/download.jpeg'), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Today,${DateFormat("Hm").format(DateTime.now())}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                    color: Colors.white),
                  ),
                ),
              ),
              Flexible(
                   child:ListView.builder(
                     reverse: true,
                    padding: EdgeInsets.all(8),
                    itemCount: _messages.length,
                    itemBuilder: (context,index){
                    return Padding(
                      padding: EdgeInsets.all(16),
                      child: _messages[index]
                    );
                  }
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 32,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xff333333).withOpacity(0.3)
                              ),
                              child: TextField(
                                autocorrect: true,
                                controller: _messagecontroller,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.transparent, // Important for backdrop filter
                                  contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                  hintText: 'How can I help you....',
                                ),
                              ),
                            ),
                        ),
                    ),
                    SizedBox(width: 10),
                    // Container(
                    //   padding: const EdgeInsets.only(bottom: 20),
                    //   child: ListTile(
                    //     trailing: IconButton(icon : const Icon(Icons.send,color: Color(
                    //         0xffFF6B81),
                    //       size: 30,), onPressed: () {
                    //       if(_messagecontroller.text.isEmpty){
                    //         print("empty model");
                    //       }
                    //       else{
                    //         _sendMessage();
                    //
                    //       }
                    //     },),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        if(_messagecontroller.text.isEmpty){
                          print("empty model");
                        }
                        else{
                          _sendMessage();
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CircleAvatar(
                            radius: 30,
                            backgroundColor:Color(0xffFF6B81),
                            child: Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ),
                      ),
                  ],
                ),
              ),
SizedBox(height: 60,),
            ],
          ),
        ),
    );

  }
}


import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key, required this.text, required this.sender});
  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: sender == "you" ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Align(
          child: Container(
            margin: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: sender == "you"?Color(0xFFe7a8b4):Colors.transparent,
              child: sender == "you"?Image.asset("assets/images/user.gif"):Image.asset("assets/images/bot.gif"),
              radius: 20,
            ),
          ),
        ),
        Flexible(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                  color: sender == "you"?Color(0xFFe7a8b4):Color(0xFFCCCCCC)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: Text(
                        sender,style: Theme.of(context).textTheme.subtitle2,),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      margin: EdgeInsets.only(top: 5),
                      child: Text(text),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}

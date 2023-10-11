import 'package:flutter/material.dart';
import 'OTPScreen.dart';

// Constants
const double tDefaultSize = 20.0;
const double tFormHeight = 20.0;

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    required this.btnIcon,
    required this.subTitle,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 60),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 25,fontWeight:FontWeight.w600)),
                Text(subTitle, style: TextStyle(fontSize: 15)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FormHeaderWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final double heightBetween;
  final TextAlign textAlign;

  const FormHeaderWidget({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.heightBetween,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image), // Assuming 'image' is a valid image path
        SizedBox(height: heightBetween),
        Text(
          title,
          style: TextStyle(
            fontSize: 24, // Adjust the font size as needed
            fontWeight: FontWeight.bold,
          ),
          textAlign: textAlign,
        ),
        SizedBox(height: 8), // Adjust the spacing between title and subtitle
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 16, // Adjust the font size as needed
          ),
          textAlign: textAlign,
        ),
      ],
    );
  }
}

class ForgetPasswordMail extends StatelessWidget {
  const ForgetPasswordMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: tDefaultSize * 4),
                FormHeaderWidget(
                  image: ("assets/images/q8-vPggS_400x400-removebg-preview.png"),
                  title: "ForgetPassword".toUpperCase(),
                  subTitle: "ForgetPasswordSubTitle",
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: tFormHeight),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Email"),
                            hintText: "Email",
                            prefixIcon: Icon(Icons.mail_outline_rounded)),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>  OTPScreen(),
                              ),
                            );
                          },
                          child: const Text("Next"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ForgetPassword", style:TextStyle(fontSize: 15)),
          Text("ForgetPasswordSub", style:TextStyle(fontSize: 15)),
          const SizedBox(height: 30.0),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgetPasswordMail(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey.shade200,
              ),
              child: Row(
                children: [
                  Icon(Icons.mail_outline_rounded, size: 60),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email", style:TextStyle(fontSize: 25)),
                      Text("Reset Email", style:TextStyle(fontSize: 15)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

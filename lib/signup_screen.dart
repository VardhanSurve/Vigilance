
import 'package:basic/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'NavBar.dart';


// Define DefaultSize as a constant double value
const double DefaultSize = 16.0;
const double FormHeight = 60.0;


class SignupScreen extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignupScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/8459ad298c58aa2d544ecbef33d4c5c5.jpg', // Replace with your image path
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          SingleChildScrollView(

            child: Container(
              padding: const EdgeInsets.all(DefaultSize),
              child: Column(
                children: [
                  Container(
                    height: screenWidth*0.1,
                  ),
                  Positioned(
                    top: 40,
                    child: Container(
                      child: Text("C R E A T E ",
                        style: TextStyle(
                          color: Color(0XFF795548),
                          fontSize: 50.0, // Adjust font size
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    child: Container(
                      child: Text("A C C O U N T ",
                        style: TextStyle(
                          color: Color(0XFF795548),
                          fontSize: 50.0, // Adjust font size
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ),
                 /* FormHeaderWidget(
                    image: 'assets/images/luffy.png',
                    title: "Get on Board!",
                    subTitle: "Create your profile to start your journey with us..",
                    imageHeight: 0.4,
                  ),*/
                  SignUpFormWidget(

                    emailController: emailController,

                    passwordController: passwordController,
                  ),
                  SignUpFooterWidget(),
                ],
              ),
            ),
          ),
    ],
        ),
      ),
    );
  }
}

class FormHeaderWidget extends StatelessWidget {
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  const FormHeaderWidget({
    Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.2,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(image: AssetImage(image), color: imageColor, height: size.height * imageHeight),
        SizedBox(height: heightBetween),
        Text(title, style:TextStyle(fontSize: 30)),
        Text(subTitle, textAlign: textAlign, style: TextStyle(fontSize: 15)),
      ],
    );
  }
}

class SignUpFormWidget extends StatefulWidget {

  final TextEditingController emailController;

  final TextEditingController passwordController;

  SignUpFormWidget({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);


  @override
  _SignUpFormWidgetState createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  bool _validateForm(BuildContext context) {
    final String email = widget.emailController.text.trim();
    final String password = widget.passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all required fields.'),
        ),
      );
      return false;
    }

    return true;
  }
  bool _isPasswordHidden = true;





  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: FormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: FormHeight - 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
              width: screenWidth*0.80,
              decoration: BoxDecoration(
                  color: Color(0xFFC9D9C3),//blueGrey,
                  border: Border.all(
                    color: Color(0xFF383330), // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: TextFormField(
                controller: widget.emailController,
                decoration: InputDecoration(
                  label: Text("Email",
                    style: TextStyle(
                      color: Color(0xFF383330),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                  prefixIcon: Icon(Icons.email_outlined,
                    color: Color(0xFF383330),
                    size: 35,),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: FormHeight - 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
              width: screenWidth*0.80,
              decoration: BoxDecoration(
                  color: Color(0xFFC9D9C3),//blueGrey,
                  border: Border.all(
                    color: Color(0xFF383330), // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: TextFormField(
                controller: widget.passwordController,
                obscureText: _isPasswordHidden, // Use this to control the password visibility
                decoration: InputDecoration(
                  label: Text("Password",
                    style: TextStyle(
                      color: Color(0xFF383330),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                  prefixIcon: Icon(Icons.fingerprint,
                    color: Color(0xFF383330),
                    size: 35,),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xFF383330),
                      size: 35,),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden; // Toggle password visibility
                      });
                    },
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: FormHeight - 20),
      Container(
        //padding: const EdgeInsets.symmetric(vertical:5,horizontal: 30),
        width: screenWidth*0.34,
        decoration: BoxDecoration(
          color: Color(0xFFC9D9C3),
          border: Border.all(
            color: Color(0xFF383330), // Border color
            width: 2.0, // Border width
          ),
          borderRadius: BorderRadius.circular(15.0), // Border radius
        ),

      ),
            const SizedBox(height: FormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_validateForm(context) ) {
                    try {
                      await FirebaseAuth.instance.currentUser!.delete();
                      print("Account deleted ");
                      UserCredential newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: widget.emailController.text,
                          password: widget.passwordController.text);
                      print("Registered");
                      if (newUser != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (
                              context) => NavBar()),
                        );
                      }

                    }
                    on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('The password provided is too weak.'),
                          ),
                        );
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('The account already exists for that email.'),
                          ),
                        );
                        print('The account already exists for that email.');
                      }
                    }


                    catch (e) {
                      print(e);
                    } // Your user signup logic here
                  } else {
                    // Show an error message on the signup page
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please fill in all required fields.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 18.0), // Adjust padding for consistency
                  backgroundColor: Color(0XFF795548),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
                child: Text("",style: TextStyle(color: Color(0xFFFEFAE0)),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavBar()), // Navigate to LoginPage
            );
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: "Already have an account? ",
              style:TextStyle(
                color: Colors.blue,
              ),// Use the variable here
            ),
            TextSpan(text: "login".toUpperCase(),style: TextStyle(color: Colors.green,)), // Use the variable here
          ])),
        ),
      ],
    );
  }
}

// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'NavBar.dart';
import 'main.dart';
import 'dart:ui';
import 'signup_screen.dart';
import 'package:rive/rive.dart';
import 'forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
// Define DefaultSize as a constant double value
const double DefaultSize = 16.0;

const String tWelcomeScreenImage = 'assets/images/luffy.png'; // Replace with your image path
const String tLoginTitle = 'Login Title'; // Replace with your login title
const String tLoginSubTitle = 'Login Subtitle'; // Replace with your login subtitle

const double tFormHeight = 60.0; // Replace with your desired form height
String tEmail = 'Email'; // Replace with your email label
 String tPassword = 'Password'; // Replace with your password label
const String tForgetPassword = 'Forgot Password?'; // Replace with your forgot password label
const String tLogin = 'Login'; // Replace with your login button label
const double tDefaultSize = 16.0; // You can adjust the value as needed

const String tGoogleLogoImage = 'assets/images/q8-vPggS_400x400-removebg-preview.png'; // Replace with your Google logo image path
const String tSignInWithGoogle = 'Sign in with Google'; // Replace with your Google sign-in text
const String tDontHaveAnAccount = "Don't have an account? "; // Replace with your text
const String tSignup = 'Sign Up'; // Replace with your sign-up text





void main()  {

  runApp(const LoginPage());
}
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  bool showSpinner = false;

  void _showForgetPasswordBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => ForgetPasswordBottomSheet(), // Use the new widget here
    );
  }

  bool _isPasswordHidden = true;



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Get the size in LoginHeaderWidget()
    final size = MediaQuery.of(context).size;


    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/d517a545456c52383b01b2e215415d98.jpg', // Replace with your image path
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            // Blur effect
           /* BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child:ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),*/
            SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(DefaultSize),
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 // Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                  //  children: [
                      /*Positioned(
                        top: 10,
                        left: 0,
                        child: Container(
                          width: screenWidth*1.1,height: screenWidth*1.1,
                      child: RiveAnimation.asset('assets/images/a_boy.riv'),
                      ),
                      ),*/
                  Container(
                    height: screenWidth*0.3,
                  ),
                      Positioned(
                        top: 40,
                        child: Container(
                          child: Text("LOGIN",
                            style: TextStyle(
                            color: Color(0XFF795548),
                            fontSize: 50.0, // Adjust font size
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ),
                     // Text(tLoginSubTitle, style: Theme.of(context).textTheme.bodyLarge),
                   // ],
                //  ),
                  Container(
                    height: screenWidth*0.15,
                  ),
                  Container(
                    height: screenWidth*1.2,
                    width: screenWidth*1.70,
                    //color: Colors.cyan,
                   /* decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.5), // Adjust opacity as needed
                      borderRadius: BorderRadius.circular(20.0),
                      // Add blur effect
                     // backdropFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      // Add border
                      border: Border.all(color: Colors.black, width: 2.0),
                    ),*/
                    child: Form(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person_outline_outlined,
                                    color: Color(0xFF383330),
                                    size: 35,
                                    ),
                                  label: Text("Email",
                                    style: TextStyle(
                                      color: Color(0xFF383330),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),),

                                    border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  // Store the user's answer for Question 1
                                  print(tEmail);
                                  tEmail = value;
                                },

                              ),
                            ),
                            const SizedBox(height: tFormHeight -35),
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
                                        width: screenWidth*0.80,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFC9D9C3),
                                          border: Border.all(
                                            color: Color(0xFF383330), // Border color
                                            width: 2.0, // Border width
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: TextFormField(
                                          obscureText: _isPasswordHidden, // Use this to control the password visibility
                                          decoration: InputDecoration(
                                            label: Text("Password",
                                            style: TextStyle(
                                              color: Color(0xFF383330),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                            border: InputBorder.none,
                                            prefixIcon: const Icon(Icons.fingerprint,
                                            color: Color(0xFF383330),
                                            size: 35,),
                                            suffixIcon: IconButton(
                                              icon: Icon(_isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                                              color: Color(0xFF383330),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _isPasswordHidden = !_isPasswordHidden; // Toggle password visibility
                                                });
                                              },
                                            ),
                                          ),

                              onChanged: (value) {
                                // Store the user's answer for Question 1
                                tPassword = value;
                                print(tPassword);
                              },
                            ),
                                      ),

                            const SizedBox(height: tFormHeight - 20),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  _showForgetPasswordBottomSheet(context); // Call the function to show the bottom sheet
                                },
                                child: Text("Forget password?".toUpperCase(),
                                    style: TextStyle(
                                      color: Color(0xFFD4BDA1),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),),
                              ),
                            ),
                            Container(
                              height: 15,
                            ),
                            SizedBox(
                              width: screenWidth*0.75,
                              child: ElevatedButton(
                                onPressed: () async {
                                  print(tEmail);

                                    try {
                                      await FirebaseAuth.instance.currentUser!.delete();
                                      print("Account deleted ");
                                      UserCredential user = await FirebaseAuth
                                          .instance.signInWithEmailAndPassword(
                                          email:tEmail,
                                          password:tPassword);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                               NavBar(), // Replace with the name of your MyApp class
                                        ),
                                      );
                                                                        } on FirebaseAuthException catch (e) {
                                      if (e.code == 'user-not-found') {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'No user found for that email.'),
                                          ),
                                        );
                                        print('No user found for that email.');
                                      } else if (e.code == 'wrong-password') {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Wrong password provided for that user.'),
                                          ),
                                        );
                                        print(
                                            'Wrong password provided for that user.');
                                      }
                                    }

                                    catch (e) {
                                      print(e);
                                    }
                                    setState(() {
                                      showSpinner = false;
                                    });


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
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [



                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignupScreen()), // Navigate to SignupPage
                            );
                          },
                          child: Text.rich(
                            TextSpan(
                                text: tDontHaveAnAccount,
                                style:TextStyle(
                                  color: Color(0xFFFEFAE0),
                                ),
                                children: const [
                                  TextSpan(text: tSignup, style: TextStyle(color: Color(0xFFD4BDA1),))
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
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

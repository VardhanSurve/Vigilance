// ignore_for_file: use_build_context_synchronously

import 'package:basic/ProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ProfilePageForm.dart';
import 'signup_screen.dart';
import 'ProfilePage.dart';
import 'LoginPage.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});



  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 230,
      child: Container(
        color: Color(0xff007A78).withOpacity(0.5),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [
        //       Color(0xffff6b81), // Start color
        //       Color(0xfff1dadd), // Clash in the center
        //       Color(0xffcdebf1), // Bottom color
        //     ],
        //   ),
        // ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: UserAccountsDrawerHeader(
                accountName: const Text(''),
                accountEmail: Text("email",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),),
                currentAccountPicture: InkWell(
                  onTap: () {
                    print("ProfilePage");
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(120.0),
                  ),
                  color: Color(0xff4deeec).withOpacity(1),
                ),
              ),
            ),

            SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.contact_page, color: Color(0xff0c3e42),size: 35,), // Change icon color to black
              title: const Text('Profile Form',
                style: TextStyle(
                    color: Color(0xff0c3e42),
                    fontSize: 18
                ),),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfilePageForm(),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.settings, size: 35,color: Colors.white,), // Change icon color to black
              title: const Text('Signup',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.login, color: Color(0xff0c3e42),size: 35,), // Change icon color to black
              title: const Text('Login',
                style: TextStyle(
                    color: Color(0xff0c3e42),
                    fontSize: 18
                ),),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),

            SizedBox(height: 10),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white,size: 35,), // Change icon color to black
              title: const Text('Logout',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                 // Close the drawer
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.remove_circle_outline, color: Color(0xff0c3e42),size: 35,), // Change icon color to black
              title: const Text('Delete Account',
                style: TextStyle(
                    color: Color(0xff0c3e42),
                    fontSize: 18
                ),),
              onTap: () async {
                try {
                  await FirebaseAuth.instance.currentUser!.delete();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You must reauthenticate before this operation can be executed.'),
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'requires-recent-login') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('You must reauthenticate before this operation can be executed.'),
                      ),
                    );
                    print('The user must reauthenticate before this operation can be executed.');
                  }
                }

                // try {
                //   await FirebaseAuth.instance.currentUser!.delete();
                // } on FirebaseAuthException catch (e) {
                //   if (e.code == 'requires-recent-login') {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Text('You must reauthenticate before this operation can be executed.'),
                //       ),
                //     );
                //     print('The user must reauthenticate before this operation can be executed.');
                //   }
                // }
                // Navigator.pop(context); // Close the drawer
                // Navigator.pushNamed(context, '/login'); // Navigate to the login page
              },
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:ui';
import 'NavBar.dart';

class ProfilePageForm extends StatefulWidget {
  @override
  _ProfilePageFormState createState() => _ProfilePageFormState();
}

class _ProfilePageFormState extends State<ProfilePageForm> {
  String? dropValue;
  String name = '';
  String number = '';
  String address = '';
  String relation ='';
  String contactNumber='';
  String age = '0';
  String selectedGender = 'Male'; // Default to Male


  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController relationController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 1100,
          child: Stack(
            children: [
              // Background Image
              Container(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0), // Adjust sigmaX and sigmaY for desired blur intensity
                  child: Image.asset(
                    'assets/images/pink2.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Container with Semi-Transparent Color
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.25),
              ),
              // Form Content
              Stack(
                children: [
                  Positioned(
                    top: 90.0,
                    left: 20,
                    right: 0,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Color(0xff37949d), size: 30),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          '   Profile Form',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff37949d),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 150.0,
                    left: 16.0,
                    right: 16.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                width: 450,
                                decoration: BoxDecoration(
                                  color: Color(0xfff6b4bb),
                                  border: Border.all(
                                    color: Color(0xff37949d),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    label: Text(
                                      '   Name',
                                      style: TextStyle(
                                        color: Color(0xFF383330),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                                      child: Icon(Icons.person, color: Color(0xff37949d), size: 35),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Color(0xFF383330),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                width: 450,
                                decoration: BoxDecoration(
                                  color: Color(0xfff6b4bb),
                                  border: Border.all(
                                    color: Color(0xff37949d),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextField(
                                  controller: numberController,
                                  decoration: InputDecoration(
                                    label: Text(
                                      '   Number',
                                      style: TextStyle(
                                        color: Color(0xFF383330),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                                      child: Icon(Icons.phone, color: Color(0xff37949d), size: 35),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Color(0xFF383330),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                width: 450,
                                decoration: BoxDecoration(
                                  color: Color(0xfff6b4bb),
                                  border: Border.all(
                                    color: Color(0xff37949d),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextField(
                                  controller: ageController,
                                  decoration: InputDecoration(
                                    label: Text(
                                      '   Age',
                                      style: TextStyle(
                                        color: Color(0xFF383330),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                                      child: Icon(Icons.cake, color: Color(0xff37949d), size: 35),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Color(0xFF383330),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint:Row(
                                    children: [
                                      Icon(
                                        Icons.list,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Gender??',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: ['Male', 'Female', 'Others']
                                      .map((String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                                      .toList(),
                                  value: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value!;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 50,
                                    width: 300,
                                    padding: const EdgeInsets.only(left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: const Color(0xff37949d),
                                    ),
                                    elevation: 2,
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_downward_outlined,
                                    ),
                                    iconSize: 20,
                                    iconEnabledColor: Colors.white,
                                    iconDisabledColor: Colors.grey,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Color(0xff7eabb6),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                    padding: EdgeInsets.only(left: 14, right: 14),
                                  ),
                                ),
                              ),
                              SizedBox(height: 70),
                              Text('Emergency Contacts:', style: TextStyle(color: Color(0xff37949d), fontWeight: FontWeight.bold, fontSize: 25)),
                              SizedBox(height: 30),
                              Column(
                                children: [
                                  Container(
                                    width: 450,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff6b4bb),
                                      border: Border.all(
                                        color: Color(0xff37949d),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: TextField(
                                      controller: relationController,
                                      decoration: InputDecoration(
                                        label: Text(
                                          '   Relation',
                                          style: TextStyle(
                                            color: Color(0xFF383330),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                                          child: Icon(Icons.person, color: Color(0xff37949d), size: 35),
                                        ),
                                        labelStyle: TextStyle(
                                          color: Color(0xFF383330),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    width: 450,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff6b4bb),
                                      border: Border.all(
                                        color: Color(0xff37949d),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: TextField(
                                      controller: contactNumberController,
                                      decoration: InputDecoration(
                                        label: Text(
                                          '   Contact No.',
                                          style: TextStyle(
                                            color: Color(0xFF383330),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                                          child: Icon(Icons.phone, color: Color(0xff37949d), size: 35),
                                        ),
                                        labelStyle: TextStyle(
                                          color: Color(0xFF383330),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    width: 450,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff6b4bb),
                                      border: Border.all(
                                        color: Color(0xff37949d),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: TextField(
                                      controller: addressController,
                                      decoration: InputDecoration(
                                        label: Text(
                                          '   address',
                                          style: TextStyle(
                                            color: Color(0xFF383330),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                                          child: Icon(Icons.home, color: Color(0xff37949d), size: 35),
                                        ),
                                        labelStyle: TextStyle(
                                          color: Color(0xFF383330),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 30),

                                ],
                              ),
                              SizedBox(height: 40),
                              SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // Collect all the data from the controllers
                                    name = nameController.text;
                                    number = numberController.text;
                                    age = ageController.text;
                                    relation = relationController.text;
                                    contactNumber = contactNumberController.text;
                                    address = addressController.text;

                                    if (name.isNotEmpty && number.isNotEmpty && address.isNotEmpty && age.isNotEmpty) {
                                      final user = FirebaseAuth.instance.currentUser;
                                      if (user != null) {
                                        final userDocRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

                                        // Update the user's profile data
                                        await userDocRef.set({
                                          'name': name,
                                          'number': number,
                                          'age': age,
                                          'gender': selectedGender,
                                          'address': address,
                                        });

                                        // Update the user's emergency contacts
                                        await userDocRef.collection('relations').doc('contacts').set({
                                          'relations': relation,
                                          'numbers': contactNumber,
                                        });

                                        // Mark the profile as completed
                                        await userDocRef.update({'profile_completed': true});

                                        // Show a SnackBar to indicate that the data has been saved.
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Profile saved!')),
                                        );

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => NavBar()),
                                        );
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Validation Error: Some fields are empty or invalid.')),
                                      );
                                      // Handle form validation errors or empty fields here.
                                      // You can show an error message or take any appropriate action.
                                    }

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(fontSize: 16, color: Color(0xfff6b4bb)),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff37949d),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: Color(0xfff6b4bb)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

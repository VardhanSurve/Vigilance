import 'package:basic/compo/settingsmenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePagee extends StatelessWidget {
  const ProfilePagee({Key? key,
    this.isNetworkImage = false,}) : super(key: key);
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 250,
                child: Column(
                  children: [
                    AppBar(title: Text('Account',style: TextStyle(fontSize: 20),),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          Container(
                              width: 80,
                              height: 80,
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Center(
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image:AssetImage('assets/images/708003cc0c717bfa933ca2937b6153f2.jpg'),
                                    height: 120,
                                    width: 120,
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Text(
                               "Gaga",
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "gaga@gmail.com",
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              // Navigator.push<void>(
                              //   context,
                              //   MaterialPageRoute<void>(
                              //     builder: (BuildContext context) => (),
                              //   ),
                              // );
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16,)
                  ],
                )
            ),

            Container(
              height: 700,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
              ),
              child: Padding(padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("Account Settings",
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
                      ],
                    ),
                    SizedBox(height: 16,),

                    SettingMenu(icon: Icons.mobile_friendly,title: "details",subTitle:"check your detail",onTap: (){},),
                    SettingMenu(icon: Icons.list_alt,title: "permission",subTitle:"permission changes",onTap: (){},),
                    SettingMenu(icon: Icons.lock,title: "Password",subTitle:"check password",onTap: (){},),

                    SizedBox(height: 16,),
                    Row(
                      children: [
                        const Text("App Settings",
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
                      ],
                    ),
                    SizedBox(height: 16,),

                    SettingMenu(icon: Icons.light_mode,title: "Light Mode",subTitle:"",trailing: Switch(value: true,onChanged: (value){},),),
                    SettingMenu(icon: Icons.access_alarm_outlined,title: "notification",subTitle:"",trailing: Switch(value: false,onChanged: (value){},),),

                    SizedBox(height: 16,),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          // Navigator.push<void>(
                          //   context,
                          //   MaterialPageRoute<void>(
                          //     builder: (BuildContext context) => (),
                          //   ),
                          // );
                          // Use Get.to instead of Navigator.push
                         // Get.to(WelcomeScreen());
                        },child: Text('Logout'),
                      ),
                    ),
                    SizedBox(height: 16,),
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

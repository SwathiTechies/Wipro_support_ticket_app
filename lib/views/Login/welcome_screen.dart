import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wipro_ticket/views/Login/User_type.dart';
import 'package:wipro_ticket/views/Login/user_type_tabs.dart';
import 'package:wipro_ticket/widgets/app_button.dart';

import 'Register_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;

    Future.delayed(Duration(seconds: 5), () {
      Get.offAll(UserTypeScreen(),
          transition: Transition.fadeIn,
          duration: Duration(seconds: 4));
    }
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('WIPRO FACILITY INTRACT',style: TextStyle(fontWeight: FontWeight.bold,fontSize:screenHeight*0.03,color: Color(0xff415A8C)),),
                    SizedBox(height: screenHeight*0.02,),
                    Text('WELCOME',style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenHeight*0.03, color: Color(0xff415A8C)),),

                  ],
                ),

                Container(
                    height: screenHeight*0.3,
                    width: screenWidth*0.6,
                    child: Image(image: AssetImage('assets/images/wipro_logo.png'),fit: BoxFit.cover,)),
                //Image(image: AssetImage('assets/images/wipro_logo.png'),height: 900,width: 900,),
               // Spacer(),
               //  AppButton(btnText: 'LOG IN', widthSize: screenHeight*0.3, onTap: (){
               //    Navigator.push(
               //        context,
               //        MaterialPageRoute(
               //            builder: (context) => UserTypeScreen()));
               //  }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wipro_ticket/views/Login/welcome_screen.dart';
import 'package:wipro_ticket/views/dashboard_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 5), () {
      Get.offAll(WelcomeScreen(),
          transition: Transition.fadeIn,
          duration: Duration(seconds: 4));
    }
    );
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;
    return Scaffold(

        body: Center(
          child: Container(
              height: screenHeight*0.3,
              width: screenWidth*0.6,
              child: Image(image: AssetImage('assets/images/wipro_logo.png'),fit: BoxFit.cover,)),
        )
    );
  }
}
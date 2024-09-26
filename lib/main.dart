import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wipro_ticket/views/Login/Register_screen.dart';
import 'package:wipro_ticket/views/Login/User_type.dart';
import 'package:wipro_ticket/views/Login/opt_screen.dart';
import 'package:wipro_ticket/views/Login/user_type_tabs.dart';
import 'package:wipro_ticket/views/dashboard_screen.dart';
import 'package:wipro_ticket/views/splash_scree.dart';
import 'package:wipro_ticket/views/view_ticket/ticket_details_screen.dart';
import 'package:wipro_ticket/views/view_ticket/view_picture.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewPictureScreen(),
    );
  }
}



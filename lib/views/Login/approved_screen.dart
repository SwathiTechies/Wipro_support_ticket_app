import 'package:flutter/material.dart';

class ApprovedScreen extends StatefulWidget {
  const ApprovedScreen({super.key});

  @override
  State<ApprovedScreen> createState() => _ApprovedScreenState();
}

class _ApprovedScreenState extends State<ApprovedScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('USER APPROVAL', style: TextStyle(fontSize: screenHeight*0.03, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wipro_ticket/views/Login/login_screen.dart';

import '../../widgets/app_button.dart';
import 'opt_screen.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({super.key});

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  int selectedOption = 2;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'USER LOGIN',
          style: TextStyle(
              fontSize: screenHeight * 0.03, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.04,vertical: screenHeight*0.02),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EMAIL ID',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight*0.018),
                ),
                SizedBox(
                  height: screenHeight*0.01,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Email Id';  // Error message
                    }
                    return null;  // No error
                  },
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.only(top: screenHeight*0.01, bottom: screenHeight*0.01, left: screenWidth*0.02),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenHeight*0.02),
                    ),
                    filled: true,
                    fillColor: Color(0xff9B5B5),
                    hintText: 'Email Id',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: screenHeight*0.017),
                  ),
                ),
                SizedBox(
                  height: screenHeight*0.02,
                ),
                Text(
                  'MOBILE NUMBER',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight*0.018),
                ),
                SizedBox(
                  height: screenHeight*0.01,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Contact Number';  // Error message
                    }
                    return null;  // No error
                  },
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.only(top: screenHeight*0.01, bottom: screenHeight*0.01, left: screenWidth*0.02),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenHeight*0.02),
                    ),
                    filled: true,
                    fillColor: Color(0xff9B5B5),
                    hintText: 'Contact Number',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: screenHeight*0.017),
                  ),
                ),
                SizedBox(
                  height: screenHeight*0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Radio<int>(
                          value: 1,
                          groupValue: selectedOption,
                          onChanged: (int? value) {
                            setState(() {
                              selectedOption = value!;
                              print("Selected Option: $selectedOption");
                            });
                          },
                        ),
                        const Text('WIPRO USER'),
                      ],
                    ),
                    SizedBox(width: screenWidth*0.02), // Space between the options
                    Row(
                      children: [
                        Radio<int>(
                          value: 0,
                          groupValue: selectedOption,
                          onChanged: (int? value) {
                            setState(() {
                              selectedOption = value!;
                              print("Selected Option: $selectedOption");
                            });
                          },
                        ),
                        const Text('NON-WIPRO USER'),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.06),
                Center(
                  child: AppButton(
                      btnText: 'GET OTP',
                      widthSize: screenHeight * 0.3,
                      useAlternativeColor: false,
                      onTap: () {
                        if(_formKey.currentState!.validate()){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OtpScreen()));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DashboardScreen()));
                        }
                      }),
                ),
              ],
            ),
          ),
                ),
          
          
            ],
          ),
        ),
      ),
    );
  }
}

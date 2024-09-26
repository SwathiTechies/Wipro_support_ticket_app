import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:wipro_ticket/views/Login/Register_screen.dart';

import '../../widgets/app_button.dart';

class OtpScreen extends StatefulWidget {

  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _otpController = TextEditingController();

  _commonPinput([Color color = Colors.black26]) => PinTheme(
      width: 40,
      height: 40,
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)));



  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(image: AssetImage('assets/images/otp.png')),
              Column(
                children: [
                  Text('Otp Verification', style: TextStyle(fontSize: screenHeight*0.04,color: Color(0xff415A8C),fontWeight: FontWeight.bold),),
                  Text('Enter the OTP CODE send to your Gmail', style: TextStyle(fontSize: screenHeight*0.02, color: Color(0xff415A8C) ),),
                ],
              ),
              SizedBox(height: screenHeight*0.06),
              Column(
                children: [
                  Pinput(
                    controller: _otpController,
                    length: 6,
                    defaultPinTheme: _commonPinput(),
                    focusedPinTheme: _commonPinput(),
                    followingPinTheme: _commonPinput(),
                    onChanged: (value) {
                      _otpController.text = value;
                    },
                  ),
                  SizedBox(height: screenHeight*0.04),
                  Center(
                    child: AppButton(
                        btnText: 'VERIFY OTP',
                        widthSize: screenHeight * 0.2,
                        useAlternativeColor: false,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DashboardScreen()));
                        }),
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

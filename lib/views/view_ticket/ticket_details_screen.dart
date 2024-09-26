import 'package:flutter/material.dart';
import 'package:wipro_ticket/views/view_ticket/view_picture.dart';
import 'package:wipro_ticket/widgets/app_button.dart';

import '../../widgets/ticket_progress_track.dart';

class TicketDetailsScreen extends StatefulWidget {
  const TicketDetailsScreen({super.key});

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ticket Details',
          style: TextStyle(
              fontSize: screenHeight * 0.03, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TicketProgressTrack(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                  child: AppButton(
                btnText: 'HIGH PRIORITY',
                widthSize: screenWidth * 0.6,
                onTap: () {},
                useAlternativeColor: true,
                colors: Colors.red,
              )),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                'TICKET NUMBER',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.018),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: screenHeight * 0.01,
                      bottom: screenHeight * 0.01,
                      left: screenWidth * 0.02),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.02),
                  ),
                  filled: true,
                  fillColor: Color(0xff9B5B5),
                  hintText: 'Ticket Number',
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: screenHeight * 0.017),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'LOCATION',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.018),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: screenHeight * 0.01,
                      bottom: screenHeight * 0.01,
                      left: screenWidth * 0.02),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.02),
                  ),
                  filled: true,
                  fillColor: Color(0xff9B5B5),
                  hintText: 'Location',
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: screenHeight * 0.017),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'SUB LOCATION',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.018),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: screenHeight * 0.01,
                      bottom: screenHeight * 0.01,
                      left: screenWidth * 0.02),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.02),
                  ),
                  filled: true,
                  fillColor: Color(0xff9B5B5),
                  hintText: 'Sub Location',
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: screenHeight * 0.017),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'SUB LOCATION 2',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.018),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: screenHeight * 0.01,
                      bottom: screenHeight * 0.01,
                      left: screenWidth * 0.02),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.02),
                  ),
                  filled: true,
                  fillColor: Color(0xff9B5B5),
                  hintText: 'Sub Location 2',
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: screenHeight * 0.017),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'CATEGORY',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.018),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: screenHeight * 0.01,
                      bottom: screenHeight * 0.01,
                      left: screenWidth * 0.02),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.02),
                  ),
                  filled: true,
                  fillColor: Color(0xff9B5B5),
                  hintText: 'Category',
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: screenHeight * 0.017),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'SUB CATEGORY',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.018),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: screenHeight * 0.01,
                      bottom: screenHeight * 0.01,
                      left: screenWidth * 0.02),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.02),
                  ),
                  filled: true,
                  fillColor: Color(0xff9B5B5),
                  hintText: 'Sub Category',
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: screenHeight * 0.017),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              AppButton(
                btnText: 'VIEW PICTURE',
                widthSize: screenWidth * 0.9,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=> ViewPictureScreen()));
                },
                useAlternativeColor: false,
              ),
              SizedBox(height: screenHeight * 0.02),
              AppButton(
                  btnText: 'RE-ASSIGN TICKET',
                  widthSize: screenWidth * 0.9,
                  onTap: () {},
                  useAlternativeColor: true,
                  colors: Color(0xffC74B21)),
              SizedBox(height: screenHeight * 0.02),
              AppButton(
                btnText: 'CLOSE TICKET',
                widthSize: screenWidth * 0.9,
                onTap: () {},
                useAlternativeColor: true,
                colors: Colors.blueAccent,
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}

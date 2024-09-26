import 'package:flutter/material.dart';

class ViewPictureScreen extends StatefulWidget {
  const ViewPictureScreen({super.key});

  @override
  State<ViewPictureScreen> createState() => _ViewPictureScreenState();
}

class _ViewPictureScreenState extends State<ViewPictureScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;
    var screenWidth = mediaQuery.size.width;

    void _showImagePopup(BuildContext context, int index) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Image ${index + 1}'),
            content: Image(image: AssetImage('assets/images/wipro_logo.png'),
              width: screenWidth*0.9,
              height: screenHeight*0.3,
              fit: BoxFit.cover,),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploaded Images', style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight*0.02),),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: screenHeight*0.02, horizontal: screenWidth*0.02),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap:
                () => _showImagePopup(context, index),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical:
                    8.0),
                child: Row(
                  children: [
                    Image(image: AssetImage('assets/images/wipro_logo.png'),
                      width: screenWidth*0.2,
                      height: screenHeight*0.1,
                      fit: BoxFit.cover,),
                     SizedBox(width: screenWidth*0.05),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Image ${index + 1}',
                          style:  TextStyle(fontSize: screenHeight*0.016, fontWeight: FontWeight.bold),
                        ),
                         SizedBox(height: screenHeight*0.02),
                        Text(
                          'Size: 100x100',
                          style:  TextStyle(fontSize: screenHeight*0.014),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

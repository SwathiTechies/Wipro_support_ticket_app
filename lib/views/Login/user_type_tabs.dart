import 'package:flutter/material.dart';

import '../../widgets/app_button.dart';
import '../dashboard_screen.dart';

class UserTabs extends StatefulWidget {
  @override
  _UserTabsState createState() => _UserTabsState();
}

class _UserTabsState extends State<UserTabs> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('User Tabs'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'WIPRO USER'),
            Tab(text: 'NON-WIPRO USER'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          WiproUserWidget(),  // Content for WIPro User tab
          NonWiproUserWidget(), // Content for Non-Wipro User tab
        ],
      ),
    );
  }
}

// Replace these with your desired widgets or content for each tab
class WiproUserWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;
    return Padding(
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
              height: screenHeight*0.06,
            ),
            Center(
              child: AppButton(
                  btnText: 'GET OTP',
                  widthSize: screenHeight * 0.3,
                  onTap: () {
                    if(_formKey.currentState!.validate()){
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ApprovedScreen()));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen()));
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class NonWiproUserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is the Non-Wipro User tab'),
    );
  }
}
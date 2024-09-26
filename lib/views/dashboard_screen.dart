import 'package:flutter/material.dart';
import 'package:wipro_ticket/views/register_ticket/ticket_register_screen.dart';
import 'package:wipro_ticket/views/view_ticket/view_ticket_screen.dart';

import '../widgets/camera.dart';
import 'action_management/action_management_screen.dart';
import 'action_taker/action_tacker_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<TicketMenu> _list = [
    TicketMenu(TicketName: "Register Ticket", color: Color(0xff66921f)),
    TicketMenu(TicketName: "View Ticket", color: Color(0xffA621C7)),
    TicketMenu(TicketName: "Action Taker", color: Color(0xff21C7AE)),
    TicketMenu(TicketName: "AMS Action Management", color: Color(0xffBD5A30))
  ];

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;

    return Scaffold(
        appBar: AppBar(
          //toolbarHeight: 80,
          //backgroundColor: Colors.brown,
          leading: Container(
            margin: EdgeInsets.only(left:screenWidth*0.02),
              //color: Colors.red,
              // height: 150,
              // width: 150,
              child: Image(image: AssetImage('assets/images/wipro_logo.png'),fit: BoxFit.cover,)),
          title: Text(
            'WIPRO FACILITY INTRACT',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Text(
              'DASHBOARD',
              style: TextStyle(fontSize: screenHeight*0.02, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        switch (_list[index].TicketName) {
                          case "Register Ticket":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TicketRegisterScreen()),
                            );
                            break;
                          case "View Ticket":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewTicketScreen()),
                            );
                            break;
                          case "Action Taker":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ActionTakerScreen()),
                            );
                            break;
                          case "AMS Action Management":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AMSActionManagementScreen()),
                            );
                            break;
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: screenHeight*0.02, left: screenWidth*0.06, right: screenWidth*0.06),
                        height: screenHeight*0.18,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _list[index].color),
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.only(top: screenHeight*0.03),
                            child: Column(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.note_add,
                                      color: Colors.white,
                                      size:screenHeight* 0.04,
                                    )),
                                SizedBox(
                                  height: screenHeight*0.01,
                                ),
                                Text(
                                  _list[index].TicketName,
                                  style: TextStyle(
                                      fontSize: screenHeight*0.02,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}

class TicketMenu {
  final String TicketName;
  final color;

  TicketMenu({required this.TicketName, this.color});
}

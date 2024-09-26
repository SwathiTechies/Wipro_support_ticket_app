import 'package:flutter/material.dart';
import 'package:wipro_ticket/views/view_ticket/ticket_details_screen.dart';

class ViewTicketScreen extends StatefulWidget {
  const ViewTicketScreen({super.key});

  @override
  State<ViewTicketScreen> createState() => _ViewTicketScreenState();
}

class _ViewTicketScreenState extends State<ViewTicketScreen> {

  List<TicketListData> _listData = [
    TicketListData(ticketId: '21654897', dept: 'CANTEEN', status:'OPENED'),
    TicketListData(ticketId: '789456632', dept: 'FACULTY', status:'CLOSED'),
    TicketListData(ticketId: '032156894', dept: 'FACILITY-RESTROOM', status:'IN-PROGRESS'),
    TicketListData(ticketId: '765231489', dept: 'CANTEEN', status:'HOLD'),
    TicketListData(ticketId: '765231489', dept: 'CANTEEN', status:'HOLD'),
    TicketListData(ticketId: '765231489', dept: 'CANTEEN', status:'HOLD'),
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('VIEW TICKET',
            style: TextStyle(
                fontSize: screenHeight * 0.02, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> TicketDetailsScreen()));
          },
          child: Card(
            margin: EdgeInsets.only(top:screenHeight*0.03,left: screenWidth*0.04,right: screenWidth*0.04),
            elevation: 2,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: screenHeight*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                       // margin: EdgeInsets.only(left: screenWidth*0.03),
                        height: screenHeight*0.1,
                        width: screenWidth*0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red,
                        ),
          
                        child: Icon(Icons.image),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(_listData[index].ticketId, style: TextStyle(fontSize: screenHeight*0.02),),
                      SizedBox(height: screenHeight*0.01,),
                      Text(_listData[index].dept, style: TextStyle(fontSize: screenHeight*0.02),),
                      SizedBox(height: screenHeight*0.01,),
                      Text(_listData[index].status, style: TextStyle(fontSize: screenHeight*0.02,color: Colors.red,fontWeight: FontWeight.bold),),
                    ],
                  )
                ],
              ),
            )
          ),
        );
      }),
    );
  }
}

class TicketListData{
  final String ticketId;
  final String dept;
  final String status;

  TicketListData({required this.ticketId, required this.dept, required this.status});
}

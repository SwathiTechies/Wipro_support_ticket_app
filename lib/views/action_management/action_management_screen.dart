import 'package:flutter/material.dart';

class AMSActionManagementScreen extends StatefulWidget {
  const AMSActionManagementScreen({super.key});

  @override
  State<AMSActionManagementScreen> createState() => _AMSActionManagementScreenState();
}

class _AMSActionManagementScreenState extends State<AMSActionManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AMSActionManagementScreen'),
      ),
    );
  }
}

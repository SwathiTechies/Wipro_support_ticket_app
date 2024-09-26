import 'package:flutter/material.dart';


class ActionTakerScreen extends StatefulWidget {
  const ActionTakerScreen({super.key});

  @override
  State<ActionTakerScreen> createState() => _ActionTakerScreenState();
}

class _ActionTakerScreenState extends State<ActionTakerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ActionTakerScreen'),
      ),
    );
  }
}

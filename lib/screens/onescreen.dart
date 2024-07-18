import 'package:flutter/material.dart';

class OneScreen extends StatefulWidget {
  final String? txt;

  const OneScreen({super.key, this.txt});

  @override
  State<OneScreen> createState() => _OneScreenState(txt);
}

class _OneScreenState extends State<OneScreen> {
  final String? txt;
  _OneScreenState(this.txt);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [Text(txt!)],
      ),
    );
  }
}

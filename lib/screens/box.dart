import 'package:flutter/material.dart';

class Box extends StatefulWidget {
  var player;
  Border borderOfBox;

  Box(this.player, this.borderOfBox);

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      width: 120,
      height: 120,
      child: Text(
        widget.player,
        style: const TextStyle(color: Colors.white, fontSize: 105),
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(border: widget.borderOfBox),
    );
  }
}

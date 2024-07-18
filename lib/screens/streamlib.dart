import 'package:flutter/material.dart';

import 'end.dart';

class streamlib extends StatefulWidget {
  const streamlib({super.key});

  @override
  State<streamlib> createState() => _streamlibState();
}

class _streamlibState extends State<streamlib> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(children: [
              Icon(Icons.keyboard_arrow_left, size: 40, color: Colors.white),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text('Stream Liberary',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)))
            ])),
        body: Column(children: [
          SizedBox(height: 90),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Image.asset(
                'lib/assets/streamlibb.webp',
              )),
          SizedBox(height: 15),
          Text(
            'Start Making your Collection',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'Find Movies You like,relax,and enjoy watching them   on your phone or Tv App',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 20),
          Container(
              padding: EdgeInsets.symmetric(vertical: 6),
              height: 40,
              width: 180,
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomScreen()));
                  },
                  child: Text(
                    'Explore Movies',
                    style: TextStyle(fontSize: 15, color: Colors.red),
                    textAlign: TextAlign.center,
                  )))
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:testecom/screens/dashboardScreen.dart';

import 'end.dart';

class yourorders extends StatefulWidget {
  const yourorders({super.key});

  @override
  State<yourorders> createState() => _yourordersState();
}

class _yourordersState extends State<yourorders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Icon(
                Icons.keyboard_arrow_left,
                size: 40,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Your Orders',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              )
            ],
          )),
      body: Column(
        children: [
          SizedBox(height: 90),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: Image.asset(
              'lib/assets/yourevents.webp',
              height: 100,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'You have no Bookings.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 4),
          Text(
            'How about you get started?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6),
            height: 40,
            width: 100,
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomScreen()));
              },
              child: Text(
                'Explore',
                style: TextStyle(fontSize: 15, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

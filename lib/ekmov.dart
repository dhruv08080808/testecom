import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ekmov extends StatefulWidget {
  const ekmov({super.key});

  @override
  State<ekmov> createState() => _ekmovState();
}

class _ekmovState extends State<ekmov> {
  _launchURL() async {
    if (Platform.isIOS) {
      if (await canLaunch(
          'youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw')) {
        await launch(
            'youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
            forceSafariVC: false);
      } else {
        if (await canLaunch(
            'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw')) {
          await launch(
              'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw');
        } else {
          throw 'Could not launch https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw';
        }
      }
    } else {
      const url = 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(children: [
          Icon(
            Icons.keyboard_arrow_left,
            size: 34,
            color: Colors.black,
          ),
          SizedBox(width: 10),
          Text('Zara  Hatke Zara Bachke',
              style: TextStyle(fontSize: 20, color: Colors.black)),
        ]),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          ElevatedButton(
              onPressed: () {
                _launchURL();
              },
              child: Image.asset(
                'lib/assets/zaraa.webp',
                // width: double.infinity,
              )),
          SizedBox(height: 10),
          Row(
            children: [
              // Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              Icon(
                Icons.star,
                color: Colors.red,
                size: 30,
              ),
              Text(
                '7.5/10 ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('62K Votes'),
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Container(
                color: Colors.grey,
                child: Text(
                  '2D',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

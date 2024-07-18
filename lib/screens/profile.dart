import 'dart:io';

import 'package:flutter/material.dart';
import 'package:testecom/screens/yourorders.dart';
import 'package:url_launcher/url_launcher.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi!',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Row(
                  children: [
                    Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_sharp,
                      color: Colors.white,
                    )
                  ],
                )
              ],
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.person_2_rounded,
                    size: 40,
                  ))
            ]),
        body: ListView(children: [
          SizedBox(height: 10),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => yourorders()));
            },
            child: Container(
                //color: Color.fromARGB(179, 245, 244, 244),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(Icons.shopping_bag,
                          size: 34, color: Colors.grey)),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your Orders', style: TextStyle(fontSize: 15)),
                        Text('View all your bookings & purchases'),
                      ]),
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.keyboard_arrow_right)))
                ])),
          ),
          Divider(thickness: 1, color: Colors.grey, height: 20),
          Container(
              //color: Color.fromARGB(179, 245, 244, 244),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(Icons.tv_sharp, size: 34, color: Colors.grey)),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Stream Liberary', style: TextStyle(fontSize: 15)),
                      Text('Rented & Purchased Movies')
                    ]),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_right)))
              ])),
          Divider(thickness: 1, color: Colors.grey, height: 20),
          Container(
              // color: Color.fromARGB(179, 245, 244, 244),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                      Icon(Icons.money_rounded, size: 34, color: Colors.grey),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Play Credit Card',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text('View your play credit card details and offers')
                    ]),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_right)))
              ])),
          Divider(thickness: 1, color: Colors.grey, height: 20),
          Container(
              //color: Color.fromARGB(179, 245, 244, 244),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(Icons.question_answer_outlined,
                      size: 34, color: Colors.grey),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Help Center',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text('Need Help or have questions?')
                    ]),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_right)))
              ])),
          Divider(thickness: 1, color: Colors.grey, height: 20),
          Container(
              //color: Color.fromARGB(179, 245, 244, 244),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(Icons.settings, size: 34, color: Colors.grey),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Accounts & Settings',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text('Locations,Passwords,permissions & more')
                    ]),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_right)))
              ])),
          Divider(thickness: 1, color: Colors.grey, height: 20),
          Divider(thickness: 1, color: Colors.grey, height: 20),
          Container(
              //color: Color.fromARGB(179, 245, 244, 244),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(Icons.card_giftcard_sharp,
                      size: 34, color: Colors.grey),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Rewards',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text('View Your Rewards & unlock new ones'),
                    ]),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_right)))
              ])),
          Divider(thickness: 1, color: Colors.grey, height: 20),
          Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(Icons.percent_rounded,
                        size: 34, color: Colors.grey)),
                Text('Offers', style: TextStyle(fontSize: 17)),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_right)))
              ]),
          Divider(thickness: 1, color: Colors.grey, height: 20),
          Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(Icons.price_change_rounded,
                        size: 34, color: Colors.grey)),
                Text('Resturant Discounts', style: TextStyle(fontSize: 15)),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_right)))
              ]),
          Divider(thickness: 1, color: Colors.grey, height: 20),
          Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(Icons.discount_outlined,
                        size: 34, color: Colors.grey)),
                Text('Discount Store', style: TextStyle(fontSize: 15)),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_right)))
              ]),
          Divider(thickness: 1, color: Colors.grey, height: 20),

          //color: Color.fromARGB(179, 245, 244, 244),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.card_giftcard, size: 34, color: Colors.grey),
            ),
            Text(
              ' Gift Cards',
              style: TextStyle(fontSize: 15),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.keyboard_arrow_right)))
          ]),

          Divider(thickness: 1, color: Colors.grey, height: 20),
          //color: Color.fromARGB(179, 245, 244, 244),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.fastfood_rounded, size: 34, color: Colors.grey),
            ),
            Text(
              ' Food & Beverages',
              style: TextStyle(fontSize: 15),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.keyboard_arrow_right)))
          ]),
          Divider(thickness: 1, color: Colors.grey, height: 20),
          //color: Color.fromARGB(179, 245, 244, 244),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.house_outlined, size: 34, color: Colors.grey),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                ' Food & Beverages',
                style: TextStyle(fontSize: 15),
              ),
              Text('Got An Event?Patner With us',
                  style: TextStyle(fontSize: 15)),
              SizedBox(
                height: 10,
              )
            ]),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.keyboard_arrow_right)))
          ]),
          Container(
              height: 170,
              color: Colors.blueGrey.shade50,
              child: Column(children: [
                SizedBox(height: 45),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 40)),
                      Text('Share',
                          style: TextStyle(
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w300)),
                      Text('|',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300)),
                      Text('Rate us',
                          style: TextStyle(
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w300)),
                      Text('|',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w200)),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Icon(
                            Icons.my_library_books_sharp,
                            size: 20,
                          ))
                    ]),
                SizedBox(height: 20),
                Text('App version:12.4.1'),
                SizedBox(height: 10),
                GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if (Platform.isAndroid || Platform.isIOS) {
                        final appId = Platform.isAndroid
                            ? 'com.bt.bms'
                            : 'YOUR_IOS_APP_ID';
                        final url = Uri.parse(Platform.isAndroid
                            ? "market://details?id=$appId"
                            : "https://apps.apple.com/app/id$appId");
                        launchUrl(url);
                      }
                    },
                    child: Text(
                      'Update Now',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ))
              ]))
        ]));
  }
}

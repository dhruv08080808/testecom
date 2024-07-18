import 'package:flutter/material.dart';
import 'package:testecom/screens/yourorders.dart';

class mumbai extends StatefulWidget {
  const mumbai({super.key});

  @override
  State<mumbai> createState() => _mumbaiState();
}

class _mumbaiState extends State<mumbai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Mumbai',
            style: TextStyle(fontSize: 14),
          ),
        ),
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
        ]));
  }
}

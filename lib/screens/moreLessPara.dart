import 'package:flutter/material.dart';

class MoreLessScreen extends StatefulWidget {
  MoreLessScreen();

  @override
  _MoreLessScreenState createState() => new _MoreLessScreenState();
}

class _MoreLessScreenState extends State<MoreLessScreen> {
  String? firstHalf;
  String? secondHalf;

  bool flag = true;

  String text = '';

  @override
  void initState() {
    super.initState();

    if (text.length > 50) {
      firstHalf = text.substring(0, 50);
      secondHalf = text.substring(50, text.length);
    } else {
      firstHalf = text;
      secondHalf = "option" * 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: secondHalf!.isEmpty
                ? Text(firstHalf!)
                : Column(children: <Widget>[
                    SizedBox(height: 80),
                    Text(flag
                        ? (firstHalf! + "option" * 20)
                        : (firstHalf! + secondHalf!)),
                    GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(flag ? "show more" : "show less",
                                  style: TextStyle(color: Colors.blue))
                            ]),
                        onTap: () {
                          setState(() {
                            flag = !flag;
                          });
                        })
                  ])));
  }
}

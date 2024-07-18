import 'package:flutter/material.dart';

class Howmanytick extends StatefulWidget {
  const Howmanytick({super.key});

  @override
  State<Howmanytick> createState() => _HowmanytickState();
}

class _HowmanytickState extends State<Howmanytick> {
  askForINfo() {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        // context and builder are
        // required properties in this widget
        context: context,
        builder: (BuildContext context) {
          // we set up a container inside which
          // we create center column and display text

          // Returning SizedBox instead of a Container
          return SizedBox(
              height: 500,
              child: Center(
                  child: Column(children: [
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('How Many Seats?',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                    )),
                Image.asset('lib/assets/bike.webp', height: 140),
                Divider(thickness: 1, color: Color.fromARGB(37, 0, 0, 0)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        Text('STAR CLASS', style: TextStyle(fontSize: 16)),
                        Text('₹200.00',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        Text('FILLING FAST',
                            style: TextStyle(
                                fontSize: 16, color: Colors.orange.shade600))
                      ]),
                      SizedBox(width: 10),
                      Column(children: [
                        Text('GOLD CLASS', style: TextStyle(fontSize: 16)),
                        Text('₹175.00',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        Text('AVAILABE',
                            style: TextStyle(fontSize: 16, color: Colors.green))
                      ])
                    ]),
                Container(
                    color: Colors.red,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Select Seats',
                            style: TextStyle(color: Colors.white))))
              ])));
        });
  }

  @override
  void initState() {
    if (mounted) {
      Future.delayed(Duration.zero, () {
        askForINfo();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(children: [
              Icon(Icons.keyboard_arrow_left, size: 30, color: Colors.white),
              SizedBox(width: 5),
              Column(
                children: [
                  Text('Zara Hatkr Zara Bachkr',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  Text('Delite cinema : Asaf Ali Road',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                ],
              ),
            ])),
        body: Column(children: []));
  }
}

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testecom/screens/dashboardScreen.dart';

import '../main.dart';

class delhincr extends StatefulWidget {
  const delhincr({super.key});

  @override
  State<delhincr> createState() => _delhincrState();
}

class _delhincrState extends State<delhincr> {
  checkbt() async {
    if (await Permission.location.request().isGranted) {
      print('permisson done');
    } else {
      openAppSettings();
    }
  }

  final TextEditingController searchc = TextEditingController();

  List allLoc = [
    {'id': 1, 'lat': 19.0760, 'lng': 72.8777},
    {'id': 2, 'lat': 28.7041, 'lng': 77.1025},
    {'id': 3, 'lat': 12.9716, 'lng': 77.5946},
    {'id': 4, 'lat': 17.3850, 'lng': 78.4867},
    {'id': 5, 'lat': 23.0225, 'lng': 72.5714},
    {'id': 6, 'lat': 30.7333, 'lng': 76.7794},
    {'id': 7, 'lat': 18.5204, 'lng': 73.8567},
    {'id': 8, 'lat': 13.0827, 'lng': 80.2707},
    {'id': 9, 'lat': 22.5726, 'lng': 88.3639},
    {'id': 10, 'lat': 9.9312, 'lng': 76.2673},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen()));
                    },
                    child: Icon(Icons.keyboard_arrow_left,
                        size: 35, color: Colors.white)),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Delhi-NCR',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)))
              ])),
      body: ListView(children: [
        TextFormField(
            controller: searchc,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for your city',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ))),
        SizedBox(height: 10),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            showModalBottomSheet<void>(
                // context and builder are
                // required properties in this widget
                context: context,
                builder: (BuildContext context) {
                  // we set up a container inside which
                  // we create center column and display text

                  // Returning SizedBox instead of a Container
                  return SizedBox(
                      height: 400,
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('GeeksforGeeks')])));
                });
          },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              color: Colors.white,
              child: Row(children: [
                Icon(Icons.location_searching,
                    size: 20, color: Colors.red.shade300),
                SizedBox(width: 15),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    checkbt();
                  },
                  child: Text('Auto detect My location',
                      style:
                          TextStyle(fontSize: 16, color: Colors.red.shade300)),
                )
              ])),
        ),
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      prefs!.setInt('stateID', 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen()));
                    },
                    child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            border: Border.all(color: Colors.black)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(Icons.house), Text('mumbai')])),
                  )),
                  Expanded(
                      child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      prefs!.setInt('stateID', 2);
                   
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen()));
                    },
                    child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            border: Border.all(color: Colors.black)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(Icons.house), Text('Delhi Ncr')])),
                  )),
                  Expanded(
                      child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            prefs!.setInt('stateID', 3);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardScreen()));
                          },
                          child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white70, border: Border.all()),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.house),
                                    Text('Bengaluru')
                                  ])))),
                  Expanded(
                      child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            prefs!.setInt('stateID', 4);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardScreen()));
                          },
                          child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  border: Border.all(
                                      color: Color.fromARGB(101, 0, 0, 0))),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.house),
                                    Text('Hyderabad')
                                  ]))))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            prefs!.setInt('stateID', 5);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardScreen()));
                          },
                          child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  border: Border.all(color: Colors.black)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.house),
                                    Text('Ahmedabad')
                                  ])))),
                  Expanded(
                      child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            prefs!.setInt('stateID', 6);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardScreen()));
                          },
                          child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  border: Border.all(color: Colors.black)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.house),
                                    Text('Chandigarh')
                                  ])))),
                  Expanded(
                      child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            prefs!.setInt('stateID', 7);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardScreen()));
                          },
                          child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  border: Border.all(color: Colors.black)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.house),
                                    Text('Pune')
                                  ])))),
                  Expanded(
                      child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            prefs!.setInt('stateID', 8);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardScreen()));
                          },
                          child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  border: Border.all(color: Colors.black)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.house),
                                    Text('Chennai')
                                  ]))))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            prefs!.setInt('stateID', 9);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardScreen()));
                          },
                          child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  border: Border.all(color: Colors.black)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.house),
                                    Text('Kolkata')
                                  ])))),
                  Expanded(
                      child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            prefs!.setInt('stateID', 10);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardScreen()));
                          },
                          child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  border: Border.all(color: Colors.black)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.house),
                                    Text('Kochi')
                                  ])))),
                  Expanded(
                      child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              border: Border.all(color: Colors.black)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('')]))),
                  Expanded(
                      child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              border: Border.all(color: Colors.black)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('')])))
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

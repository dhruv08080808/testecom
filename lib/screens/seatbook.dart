import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'onescreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class seatbook extends StatefulWidget {
  final String? appSubtitle;
  seatbook({super.key, this.appSubtitle});

  @override
  State<seatbook> createState() => _seatbookState(appSubtitle);
}

class _seatbookState extends State<seatbook> {
  int _currentPage = 0;

  Timer? _timer;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    if (mounted) {
      Future.delayed(Duration.zero, () {
        askForINfo();
      });
    }
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 350), curve: Curves.easeIn);
    });
  }

  String? selectedImage;

  List<String> allImgs = [
    'lib/assets/bikeeee.webp',
    'lib/assets/auto.webp',
    'lib/assets/car.webp',
    'lib/assets/taxi.webp',
    'lib/assets/scotter.webp',
    'lib/assets/bikeeee.webp',
    'lib/assets/auto.webp',
    'lib/assets/car.webp',
    'lib/assets/taxi.webp',
    'lib/assets/scotter.webp',
  ];

  void updateImage(int option) {
    // switch (option) {
    //   case 1:
    //     selectedImage = 'lib/assets/e1.webp';
    //     break;
    //   case 2:
    //     selectedImage = 'lib/assets/e2.webp';
    //     break;
    //   case 3:
    //     selectedImage = 'lib/assets/e3.webp';
    //     break;
    //   default:
    //     selectedImage = null;
    //     break;
    // }
  }

  final String? appSubtitle;
  _seatbookState(this.appSubtitle);

  double seatValue = 1.0;
  double seatval = 1;

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
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return SizedBox(
                height: 800,
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
                  Image.asset(allImgs[seatval.toInt() - 1], height: 100),
                  SfSlider(
                      min: 1,
                      max: 10,
                      value: seatval,
                      interval: 1,
                      showTicks: false,
                      activeColor: Colors.red,
                      inactiveColor: Colors.white,
                      showLabels: true,
                      // enableTooltip: true,
                      minorTicksPerInterval: 1,
                      onChanged: (value) {
                        setState(() {
                          seatval = value;
                          // if (seatval == 1) {
                          //   updateImage(1);
                          // }
                        });
                      }),
                  // Image.asset('lib/assets/bike.webp', height: 140),
                  // SizedBox(height: 20),
                  // Row(children: [
                  //   SizedBox(width: 30),
                  //   numberr(num: '1'),
                  //   SizedBox(width: 15),
                  //   numberr(num: '2'),
                  //   SizedBox(width: 15),
                  //   numberr(num: '3'),
                  //   SizedBox(width: 15),
                  //   numberr(num: '4'),
                  //   SizedBox(width: 15),
                  //   numberr(num: '5'),
                  //   SizedBox(width: 15),
                  //   numberr(num: '6'),
                  //   SizedBox(width: 15),
                  //   numberr(num: '7'),
                  //   SizedBox(width: 15),
                  //   numberr(num: '8'),
                  //   SizedBox(width: 15),
                  //   numberr(num: '9'),
                  //   SizedBox(width: 15),
                  //   numberr(num: '10'),
                  //   SizedBox(width: 15),
                  // ]),
                  SizedBox(height: 30),
                  Divider(thickness: 0.25, color: Color.fromARGB(37, 0, 0, 0)),
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
                        SizedBox(width: 13),
                        Column(children: [
                          Text('GOLD CLASS', style: TextStyle(fontSize: 16)),
                          Text('₹175.00',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          Text('AVAILABE',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.green))
                        ])
                      ]),
                  SizedBox(height: 20),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.0),
                            color: Colors.red),
                        child: Center(child: Text('SELECT SEATS'))),
                  )
                ])));
          });
        }).then((value) {
      setState(() {});
    });
  }

  void pagee() {}
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            color: Colors.blueGrey.shade200,
            height: 50,
            child: PageView(controller: _pageController, children: [
              Row(
                children: [
                  Icon(Icons.bakery_dining),
                  Text('Canara Bank Mastercard Debit Card Offer'),
                  SizedBox(width: 40),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('1/2'),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: 2,
                          effect: const ExpandingDotsEffect(
                              dotHeight: 2,
                              dotWidth: 10,
                              activeDotColor: Colors.grey
                              //type: WormType.expandi,
                              ),
                        ),
                      ]),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.bakery_dining),
                  Text('Get up to 750 on movies '),
                  SizedBox(width: 135),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('2/2'),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: 2,
                          effect: const ExpandingDotsEffect(
                            dotHeight: 2,
                            dotWidth: 10,
                            activeDotColor: Colors.grey,

                            //type: WormType.underground,
                          ),
                        ),
                      ]),
                ],
              ),
            ])),
        appBar: AppBar(
            backgroundColor: Colors.black,
            leading:
                Icon(Icons.keyboard_arrow_left, size: 40, color: Colors.white),
            title:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Zara Hatke Zara Bachke',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              // Text(appSubtitle ?? '',
              //     style: TextStyle(fontSize: 15, color: Colors.white))
            ])),
        body: ListView(children: [
          Container(
              padding: EdgeInsets.all(14),
              height: 120,
              color: Colors.grey.shade300,
              child: Column(children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    askForINfo();
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Wed,14 June', style: TextStyle(fontSize: 16)),
                        Row(children: [
                          Icon(Icons.edit, color: Colors.red),
                          Text('${seatval.toStringAsFixed(0)}tickets',
                              style: TextStyle(fontSize: 17, color: Colors.red))
                        ])
                      ]),
                ),
                SizedBox(height: 8),
                Row(children: [
                  Container(
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                            color: const Color.fromARGB(179, 0, 0, 0),
                            width: 1.0), // Set border width
                        // borderRadius:
                        //     BorderRadius.all(Radius.circular(10.0)),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          child: Column(children: [
                            GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => seatbook()));
                                },
                                child: Text('03:35 PM',
                                    style: TextStyle(color: Colors.white))),
                            Text('DIAMOND',
                                style: TextStyle(color: Colors.white))
                          ]))),
                  SizedBox(width: 20),
                  Container(
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                            color: const Color.fromARGB(179, 0, 0, 0),
                            width: 1.0), // Set border width
                        // borderRadius:
                        //     BorderRadius.all(Radius.circular(10.0)),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          child: Column(children: [
                            Text('03:35 PM',
                                style: TextStyle(color: Colors.white)),
                            Text('DIAMOND',
                                style: TextStyle(color: Colors.white))
                          ]))),
                ])
              ])),
          SizedBox(height: 20),
          // InteractiveViewer(
          //   panEnabled: false, // Set it to false to prevent panning.
          //   boundaryMargin: EdgeInsets.all(80),
          //   minScale: 0.5,
          //   maxScale: 4,
          //   child: FlutterLogo(size: 200),
          // ),
          InteractiveViewer(
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('RS.200.00 STAR CLASS',
                      style: TextStyle(fontWeight: FontWeight.w500))),
              Divider(thickness: 1, color: Colors.black),
              Row(
                children: [
                  SizedBox(width: 30),
                  smallbox(boxx: '1'),
                  SizedBox(width: 2),
                  smallbox(boxx: '2'),
                  SizedBox(width: 2),
                  smallbox(boxx: '3'),
                  SizedBox(width: 2),
                  smallbox(boxx: '4'),
                  SizedBox(width: 2),
                  smallbox(boxx: '5'),
                  SizedBox(width: 2),
                  smallbox(boxx: '6'),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  SizedBox(width: 30),
                  smallbox(boxx: '1'),
                  SizedBox(width: 2),
                  smallbox(boxx: '2'),
                  SizedBox(width: 2),
                  smallbox(boxx: '3'),
                  SizedBox(width: 2),
                  smallbox(boxx: '4'),
                  SizedBox(width: 2),
                  smallbox(boxx: '5'),
                  SizedBox(width: 2),
                  smallbox(boxx: '6'),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  SizedBox(width: 30),
                  smallbox(boxx: '1'),
                  SizedBox(width: 2),
                  smallbox(boxx: '2'),
                  SizedBox(width: 2),
                  smallbox(boxx: '3'),
                  SizedBox(width: 2),
                  smallbox(boxx: '4'),
                  SizedBox(width: 2),
                  smallbox(boxx: '5'),
                  SizedBox(width: 2),
                  smallbox(boxx: '6'),
                ],
              ),
              Row(children: [
                SizedBox(width: 82),
                smallbox(boxx: '1'),
                SizedBox(width: 2),
                smallbox(boxx: '2'),
                SizedBox(width: 2),
                smallbox(boxx: '3'),
              ]),
              SizedBox(height: 2),
              Row(children: [
                SizedBox(width: 82),
                smallbox(boxx: '1'),
                SizedBox(width: 2),
                smallbox(boxx: '2'),
                SizedBox(width: 2),
                smallbox(boxx: '3'),
              ]),
              SizedBox(height: 2),
              Row(children: [
                SizedBox(width: 82),
                three(boxi: '1'),
                SizedBox(width: 2),
                three(boxi: '2'),
                SizedBox(width: 2),
                //
                //SizedBox(width: 2),
                three(boxi: '3'),
              ]),
              SizedBox(height: 2),
              Row(children: [
                SizedBox(width: 82),
                three(boxi: '1'),
                SizedBox(width: 2),
                three(boxi: '2'),
                SizedBox(width: 2),
                three(boxi: '3'),
                SizedBox(width: 40),
                three(boxi: '4'),
                SizedBox(width: 2),
                three(boxi: '5'),
                SizedBox(width: 2),
                three(boxi: '6'),
                SizedBox(width: 2),
                three(boxi: '7'),
                SizedBox(width: 2),
                three(boxi: '8'),
                SizedBox(width: 2),
                three(boxi: '9'),
                SizedBox(width: 2),
                three(boxi: '10'),
              ]),
              SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'RS.175.00 GOLD CLASS',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                  )),
              Divider(
                thickness: 0.2,
                color: Colors.black,
              ),
              Row(
                children: [
                  SizedBox(width: 70),
                  smallbox(boxx: '1'),
                  SizedBox(width: 2),
                  smallbox(boxx: '2'),
                  SizedBox(width: 2),
                  smallbox(boxx: '3'),
                  SizedBox(width: 2),
                  smallbox(boxx: '4'),
                  SizedBox(width: 2),
                  smallbox(boxx: '5'),
                  SizedBox(width: 2),
                  smallbox(boxx: '6'),
                  SizedBox(width: 2),
                  smallbox(boxx: '7'),
                  SizedBox(width: 2),
                  three(boxi: '8'),
                  SizedBox(width: 2),
                  three(boxi: '9'),
                  SizedBox(width: 2),
                  three(boxi: '10'),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  SizedBox(width: 70),
                  smallbox(boxx: '1'),
                  SizedBox(width: 2),
                  smallbox(boxx: '2'),
                  SizedBox(width: 2),
                  smallbox(boxx: '3'),
                  SizedBox(width: 2),
                  smallbox(boxx: '4'),
                  SizedBox(width: 2),
                  smallbox(boxx: '5'),
                  SizedBox(width: 2),
                  smallbox(boxx: '6'),
                  SizedBox(width: 2),
                  smallbox(boxx: '7'),
                  SizedBox(width: 2),
                  three(boxi: '8'),
                  SizedBox(width: 2),
                  three(boxi: '9'),
                  SizedBox(width: 2),
                  three(boxi: '10'),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  SizedBox(width: 70),
                  smallbox(boxx: '1'),
                  SizedBox(width: 2),
                  smallbox(boxx: '2'),
                  SizedBox(width: 2),
                  smallbox(boxx: '3'),
                  SizedBox(width: 2),
                  smallbox(boxx: '4'),
                  SizedBox(width: 2),
                  smallbox(boxx: '5'),
                  SizedBox(width: 2),
                  smallbox(boxx: '6'),
                  SizedBox(width: 2),
                  smallbox(boxx: '7'),
                  SizedBox(width: 2),
                  three(boxi: '8'),
                  SizedBox(width: 2),
                  three(boxi: '9'),
                  SizedBox(width: 2),
                  three(boxi: '10'),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  SizedBox(width: 70),
                  smallbox(boxx: '1'),
                  SizedBox(width: 2),
                  smallbox(boxx: '2'),
                  SizedBox(width: 2),
                  smallbox(boxx: '3'),
                  SizedBox(width: 2),
                  smallbox(boxx: '4'),
                  SizedBox(width: 2),
                  smallbox(boxx: '5'),
                  SizedBox(width: 2),
                  smallbox(boxx: '6'),
                  SizedBox(width: 2),
                  smallbox(boxx: '7'),
                  SizedBox(width: 2),
                  three(boxi: '8'),
                  SizedBox(width: 2),
                  three(boxi: '9'),
                  SizedBox(width: 2),
                  three(boxi: '10'),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  SizedBox(width: 70),
                  smallbox(boxx: '1'),
                  SizedBox(width: 2),
                  smallbox(boxx: '2'),
                  SizedBox(width: 2),
                  smallbox(boxx: '3'),
                  SizedBox(width: 2),
                  smallbox(boxx: '4'),
                  SizedBox(width: 2),
                  smallbox(boxx: '5'),
                  SizedBox(width: 2),
                  smallbox(boxx: '6'),
                  SizedBox(width: 2),
                  smallbox(boxx: '7'),
                  SizedBox(width: 2),
                  three(boxi: '8'),
                  SizedBox(width: 2),
                  three(boxi: '9'),
                  SizedBox(width: 2),
                  three(boxi: '10'),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  SizedBox(width: 70),
                  smallbox(boxx: '1'),
                  SizedBox(width: 2),
                  smallbox(boxx: '2'),
                  SizedBox(width: 2),
                  smallbox(boxx: '3'),
                  SizedBox(width: 2),
                  smallbox(boxx: '4'),
                  SizedBox(width: 2),
                  smallbox(boxx: '5'),
                  SizedBox(width: 2),
                  smallbox(boxx: '6'),
                  SizedBox(width: 2),
                  smallbox(boxx: '7'),
                  SizedBox(width: 2),
                  three(boxi: '8'),
                  SizedBox(width: 2),
                  three(boxi: '9'),
                  SizedBox(width: 2),
                  three(boxi: '10'),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  SizedBox(width: 70),
                  smallbox(boxx: '1'),
                  SizedBox(width: 2),
                  smallbox(boxx: '2'),
                  SizedBox(width: 2),
                  smallbox(boxx: '3'),
                  SizedBox(width: 2),
                  smallbox(boxx: '4'),
                  SizedBox(width: 2),
                  smallbox(boxx: '5'),
                  SizedBox(width: 2),
                  smallbox(boxx: '6'),
                  SizedBox(width: 2),
                  smallbox(boxx: '7'),
                  SizedBox(width: 2),
                  three(boxi: '8'),
                  SizedBox(width: 2),
                  three(boxi: '9'),
                  SizedBox(width: 2),
                  three(boxi: '10'),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  SizedBox(width: 70),
                  smallbox(boxx: '1'),
                  SizedBox(width: 2),
                  smallbox(boxx: '2'),
                  SizedBox(width: 2),
                  smallbox(boxx: '3'),
                  SizedBox(width: 2),
                  smallbox(boxx: '4'),
                  SizedBox(width: 2),
                  smallbox(boxx: '5'),
                  SizedBox(width: 2),
                  smallbox(boxx: '6'),
                  SizedBox(width: 2),
                  smallbox(boxx: '7'),
                  SizedBox(width: 2),
                  three(boxi: '8'),
                  SizedBox(width: 2),
                  three(boxi: '9'),
                  SizedBox(width: 2),
                  three(boxi: '10'),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  SizedBox(width: 70),
                  smallbox(boxx: '1'),
                  SizedBox(width: 2),
                  smallbox(boxx: '2'),
                  SizedBox(width: 2),
                  smallbox(boxx: '3'),
                  SizedBox(width: 2),
                  three(boxi: '4'),
                  SizedBox(width: 2),
                  smallbox(boxx: '5'),
                  SizedBox(width: 2),
                  smallbox(boxx: '6'),
                  SizedBox(width: 2),
                  smallbox(boxx: '7'),
                  SizedBox(width: 2),
                  three(boxi: '8'),
                  SizedBox(width: 2),
                  three(boxi: '9'),
                  SizedBox(width: 2),
                  smallbox(boxx: '10'),
                ],
              ),
              SizedBox(height: 20),
              Image.asset(
                'lib/assets/screen.jpg',
                height: 80,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'All eyes this way Please',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 100),
              Container(
                  height: 30,
                  color: Colors.grey.shade100,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(children: [
                    Row(children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.green.shade900, width: 1.0),
                          color: Colors.white,
                        ),
                        height: 20,
                        width: 24,
                      ),
                      SizedBox(width: 13),
                      Text(
                        'Available',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.green.shade900, width: 1.0),
                          color: Colors.green,
                        ),
                        height: 20,
                        width: 24,
                      ),
                      SizedBox(width: 13),
                      Text(
                        'Selected',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.green.shade900, width: 1.0),
                          color: Colors.grey.shade200,
                        ),
                        height: 20,
                        width: 24,
                      ),
                      SizedBox(width: 13),
                      Text(
                        'Sold',
                        style: TextStyle(fontSize: 14),
                      )
                    ])
                  ]))
            ]),
          )
        ]));
  }
}

//----------------------------------- SEAT -------------------\
class smallbox extends StatelessWidget {
  String? boxx;
  smallbox({super.key, this.boxx});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green.shade900, width: 1.0),
          color: Colors.grey.shade200,
        ),
        height: 24,
        width: 24,
        child: Center(child: Text(boxx ?? '-')));
  }
}

//--------------------------------
class three extends StatelessWidget {
  String? boxi;
  three({super.key, this.boxi});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green.shade900, width: 1.0),
          color: Colors.grey.shade200,
        ),
        height: 24,
        width: 24,
        child: Center(
            child: Text(boxi ?? '-',
                style: TextStyle(fontWeight: FontWeight.w200))));
  }
}

//------------------------ button-------------
class numberr extends StatelessWidget {
  String? num;
  numberr({super.key, this.num});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(num ?? '-',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25))
    ]);
  }
}

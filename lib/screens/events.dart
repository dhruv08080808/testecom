import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class events extends StatefulWidget {
  const events({super.key});

  @override
  State<events> createState() => _eventsState();
}

class _eventsState extends State<events> {
  List<Map<String, String>> mmov = [
    {'imgg': 'lib/assets/eventt1.webp', 'textt': 'Summer \n Bucket List'},
    {'imgg': 'lib/assets/eventt2.webp', 'textt': 'Music \n Shows'},
    {'imgg': 'lib/assets/eventt3.webp', 'textt': 'Sports'},
    {'imgg': 'lib/assets/eventt4.webp', 'textt': 'Comedy \n Shows'},
    {'imgg': 'lib/assets/eventt5.webp', 'textt': 'Amusement \n Parks'},
    {'imgg': 'lib/assets/eventt6.webp', 'textt': 'All \n Experinces'},
  ];
  List<Map<String, String>> eve = [
    {'imggg': 'lib/assets/eve1.webp'},
    {'imggg': 'lib/assets/eve2.webp'},
    {'imggg': 'lib/assets/eve3.webp'},
  ];
  List<Map<String, String>> ee = [
    {'imgggg': 'lib/assets/ee1.webp'},
    {'imgggg': 'lib/assets/ee2.webp'},
    {'imgggg': 'lib/assets/ee3.webp'},
    {'imgggg': 'lib/assets/ee4.webp'},
  ];
  List<Map<String, String>> Comedy = [
    {
      'imggggg': 'lib/assets/eeee1.webp',
      'date': 'MON,3 july Onwards',
      'texti': 'Anubhav Singh Bassi -\n New Material\n ₹499 onwards'
    },
    {
      'imggggg': 'lib/assets/eeee2.webp',
      'date': 'MON,18 july Onwards',
      'texti': 'Anubhav Singh Bassi -\n New Material\n ₹799 onwards'
    },
    {
      'imggggg': 'lib/assets/eeee3.webp',
      'date': 'WED,28 jun Onwards',
      'texti': 'Anubhav Singh Bassi -\n New Material\n ₹299 onwards'
    },
    {
      'imggggg': 'lib/assets/eeee4.webp',
      'date': 'wed,28 jun Onwards',
      'texti': 'Anubhav Singh Bassi -\n New Material\n ₹1099 onwards'
    },
  ];
  List<Map<String, String>> weekend = [
    {'week': 'lib/assets/weekendd1.webp'},
    {'week': 'lib/assets/weekendd2.webp'},
    {'week': 'lib/assets/weekendd3.webp'},
    {'week': 'lib/assets/weekendd4.webp'},
  ];
  // List tt = [
  //   {},
  //   {'textt': 'Summer \n Bucket List'},
  //   {'textt': 'Summer \n Bucket List'},
  //   {'textt': 'Summer \n Bucket List'},
  //   {'textt': 'Summer \n Bucket List'},
  //   {'textt': 'Summer \n Bucket List'},
  // ];

  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
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
  //  CircleAvatar(
  //                         radius: 8,
  //                         backgroundColor: _currentPage == index
  //                             ? Colors.amber
  //                             : Colors.grey,
  //                       )

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Experience begings here',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Text('Delhi-NCR',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
            ],
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ))
          ]),
      body: ListView(children: [
        SizedBox(height: 15),
        SizedBox(
          height: 150,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Image.asset(
                      mmov[i]['imgg']!,
                      height: 90,
                    ),
                    Text(mmov[i]['textt']!),
                  ],
                );
              },
              separatorBuilder: (context, i) {
                return SizedBox(width: 10);
              },
              itemCount: mmov.length),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 15),
              Text(
                'Things to Do in your City',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(height: 5),
              Text(
                'Here is what Everyone is Booking',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              SizedBox(
                  height: 250,
                  child: PageView(controller: _pageController, children: [
                    Row(children: [
                      Image.asset('lib/assets/concert1.webp'),
                      SizedBox(width: 5),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),
                            Text(
                              'Mehfil E sartaaj-Gurgoan \n Music Shows',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Sartaaj is on the road most of \n the time.',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 15),
                            Text('₹500 onwards',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                            SizedBox(height: 15),
                          ])
                    ]),
                    Row(children: [
                      Image.asset('lib/assets/concert2.webp'),
                      SizedBox(width: 5),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),
                            Text(
                              'Worlds of Wonder Water Parks \n Amusement  Parks',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Sartaaj is on the road most of \n the time.',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 15),
                            Text('₹699 onwards',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                            SizedBox(height: 15),
                          ])
                    ]),
                    Image.asset('lib/assets/concert3.webp'),
                  ])),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  border: Border.all(width: 3.0),
                ),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'BOOK NOW',
                      style: TextStyle(),
                    )),
              ),
              SizedBox(height: 9),
              Center(
                  child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const WormEffect(
                        dotHeight: 7,
                        dotWidth: 7,
                        activeDotColor: Colors.white,
                        type: WormType.thinUnderground,
                      ))),
              SizedBox(height: 20),
            ])),
        SizedBox(height: 20),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Choices Vast But Filling Fast',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            )),
        SizedBox(height: 3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Hurry, Explore Our Range of fun events ',
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Column(children: [
                  Image.asset(
                    eve[i]['imggg']!,
                    height: 155,
                  )
                ]);
              },
              separatorBuilder: (context, i) {
                return SizedBox(width: 10);
              },
              itemCount: eve.length),
        ),
        SizedBox(height: 5),
        Container(
            height: 570,
            color: Colors.black,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Think Fun, Think Comedy',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Here\'s What We\'ve put together for you',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 9),
              SizedBox(
                height: 180,
                child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Column(children: [
                        Image.asset(
                          ee[i]['imgggg']!,
                          height: 155,
                        )
                      ]);
                    },
                    separatorBuilder: (context, i) {
                      return SizedBox(width: 10);
                    },
                    itemCount: eve.length),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Top Comedy Shows',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        Row(
                          children: [
                            Text('View All',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ])),
              SizedBox(
                height: 300,
                child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Column(children: [
                        Image.asset(
                          Comedy[i]['imggggg']!,
                          height: 180,
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: 140,
                          height: 24,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300),
                          child: Text(Comedy[i]['date']!),
                        ),
                        SizedBox(height: 4),
                        Text(
                          Comedy[i]['texti']!,
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ]);
                    },
                    separatorBuilder: (context, i) {
                      return SizedBox(width: 8);
                    },
                    itemCount: Comedy.length),
              )
            ])),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Get Set For the Weekends',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'With This Fantastic Event Lineup ',
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 180,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Column(children: [
                  Image.asset(
                    weekend[i]['week']!,
                    height: 155,
                  )
                ]);
              },
              separatorBuilder: (context, i) {
                return SizedBox(width: 14);
              },
              itemCount: weekend.length),
        ),
        //Center(child: Text(formattedDate,textAlign: TextAlign.center,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)),
      ]),
    );
  }
}

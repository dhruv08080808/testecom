import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:testecom/main.dart';
import 'package:testecom/screens/delhincr.dart';
import 'package:url_launcher/url_launcher.dart';

import '../browseByCinemaScreen.dart';
import '../common/constant.dart';
import '../common/qrcodeScreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentPage = 0;

  Timer? _timer;
  PageController _pageController = PageController(initialPage: 0);

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

  // @override
  // void dispose() { // saves mem
  //   super.dispose();
  //   _timer?.cancel();
  // }

  List categoryData = [
    {'icon': Icon(Icons.movie, size: 35), 'text': 'Movies'},
    {'icon': Icon(Icons.stream, size: 35), 'text': 'Stream'},
    {'icon': Icon(Icons.music_note, size: 35), 'text': 'Music \ shows'},
    {'icon': Icon(Icons.sports, size: 35), 'text': 'Sports'},
    {'icon': Icon(Icons.screen_lock_landscape, size: 35), 'text': 'Screening'},
    {'icon': Icon(Icons.comment, size: 35), 'text': 'Comedy Shows'},
    {'icon': Icon(Icons.select_all, size: 35), 'text': 'See All'}
  ];

  List mov = [
    {'img': 'lib/assets/zara.webp'},
    {'img': 'lib/assets/fastx.webp'},
    {'img': 'lib/assets/jori.webp'},
    {'img': 'lib/assets/ib71.webp'},
    {'img': 'lib/assets/gog.webp'},
    {'img': 'lib/assets/movie2.webp'},
  ];

  List abc = [
    {'imgg': 'lib/assets/sunburnnn.webp'},
    {'imgg': 'lib/assets/sunburn2.webp'},
    {'imgg': 'lib/assets/sunburn3.webp'},
    {'imgg': 'lib/assets/sunburn4.webp'},
    {'imgg': 'lib/assets/sunburn5.webp'},
  ];

  List top = [
    {'ism': 'lib/assets/e1.webp'},
    {'ism': 'lib/assets/e2.webp'},
    {'ism': 'lib/assets/e3.webp'},
    {'ism': 'lib/assets/e4.webp'},
    {'ism': 'lib/assets/e5.webp'},
    {'ism': 'lib/assets/e6.webp'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Constant.primaryColor,
            title:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('It All Starts Here',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => delhincr())));
                },
                child: Text(
                    '${prefs!.getInt('stateID') == 1 ? 'Mumbai' : prefs!.getInt('stateID') == 2 ? 'Delhi' : prefs!.getInt('stateID') == 3 ? 'Bangluru' : prefs!.getInt('stateID') == 4 ? 'hyderabad' : prefs!.getInt('stateID') == 5 ? 'Ahmedabad' : prefs!.getInt('stateID') == 6 ? 'Chandigarh' : prefs!.getInt('stateID') == 7 ? 'Pune' : prefs!.getInt('stateID') == 8 ? 'Chennai' : prefs!.getInt('stateID') == 9 ? 'Kolkata' : prefs!.getInt('stateID') == 10 ? 'Kochi' : '-'} >',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
              ),
            ]),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.white)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications, color: Colors.white)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QrCodeScreen()));
                  },
                  icon: Icon(Icons.qr_code, color: Colors.white))
            ]),
        body: ListView(children: [
          Container(
              padding: EdgeInsets.only(left: 10),
              height: 130,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categoryData.length,
                  itemBuilder: (context, i) {
                    return Column(children: [
                      categoryData[i]['icon'],
                      Text(categoryData[i]['text'])
                    ]);
                  },
                  separatorBuilder: (context, i) {
                    return SizedBox(width: 20);
                  })),

          SizedBox(
              height: 150,
              child: PageView(controller: _pageController, children: [
                // Image.asset('lib/assets/samesize2.webp'),
                Image.asset('lib/assets/up.webp', height: 500),
                Image.asset('lib/assets/movie.webp'),
                Image.asset('lib/assets/update2.webp'),
              ])),
          SizedBox(height: 7),
          Image.asset('lib/assets/free.webp'),
          // replace below code with proper image
          SizedBox(height: 15),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recommended Movies', style: TextStyle(fontSize: 17)),
                    Text('See All',
                        style: TextStyle(
                            fontSize: 15, color: Colors.pink.shade800))
                  ])),
          SizedBox(height: 10),
          Container(
              padding: EdgeInsets.only(left: 10),
              height: 250,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Column(children: [
                      SizedBox(
                          width: 120,
                          //  child: Image.asset('lib/assets/zara.webp', height: 170),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(mov[i]['img'], height: 220,
                                    errorBuilder: (context, error, stackTrace) {
                                  return SizedBox();
                                }),
                                SizedBox(height: 5),
                                Container(
                                    color: Colors.blue.shade50,
                                    child: Row(children: [
                                      Icon(Icons.thumb_up, size: 20),
                                      Text('18.4K Likes')
                                    ]))
                              ]))
                    ]);
                  },
                  separatorBuilder: (context, i) {
                    return SizedBox(width: 10);
                  },
                  itemCount: mov.length)),
          SizedBox(height: 25),
          Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300),
              child: Row(children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                Icon(Icons.location_pin, size: 40),
                SizedBox(width: 5),
                GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BrowseByCinemaScreen()));
                    },
                    child: Row(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text('BROWSE BY CINEMAS ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Icon(Icons.arrow_right_sharp, size: 40),
                              Icon(Icons.arrow_right_sharp, size: 40)
                            ]),
                            Text('See What s playing in Cinemas Right Now ',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold))
                          ])
                    ]))
              ])),
          SizedBox(height: 36),

          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                final Uri url = Uri.parse(
                    'https://www.ajio.com/?gclid=CjwKCAjw1YCkBhAOEiwA5aN4AWxg-Yn3Rh0kvhTINofiKkEXgZqPW--kOQ8gYmuqknqQxqhO5IN4kxoCLkYQAvD_BwE');

                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: Image.asset('lib/assets/ajio.webp', height: 170)),
          SizedBox(height: 20),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Color.fromARGB(255, 243, 236, 236),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Live. Love. Dance. Sunburn!',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500)),
                    SizedBox(height: 4),
                    Text('Asia s BIGGEST MUSIC festival!'),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 220,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return Column(children: [
                              Container(
                                  //  child: Image.asset('lib/assets/zara.webp', height: 170),
                                  child: Column(children: [
                                Image.asset(abc[i]['imgg'], height: 200)
                              ]))
                            ]);
                          },
                          separatorBuilder: (context, i) {
                            return SizedBox(width: 10);
                          },
                          itemCount: 5),
                    )
                  ])),
          SizedBox(height: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text('The Best Events This Weak',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text('Monday to Sunday, We got you covered',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
            ),
            SizedBox(height: 8),
            Column(children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Container(
                    child: Image.asset(
                      'lib/assets/plan.webp',
                      height: 120,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Image.asset(
                      'lib/assets/weekend.webp',
                      height: 120,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Container(
                  child: Image.asset(
                    'lib/assets/tom.webp',
                    height: 120,
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  child: Image.asset(
                    'lib/assets/offline.webp',
                    height: 120,
                  ),
                )
              ])
            ])
          ]),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Top Live Events Near You',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),

          SizedBox(height: 15),

          SizedBox(
            height: 300,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Column(children: [
                    Container(
                        height: 250,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        //  child: Image.asset('lib/assets/zara.webp', height: 170),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(top[i]['ism'], height: 230,
                                  errorBuilder: (context, error, stackTrace) {
                                return SizedBox();
                              }),
                              SizedBox(height: 20),
                            ])),
                    Container(
                        color: Colors.blue.shade50, child: Text('18.4K Likes'))
                  ]);
                },
                separatorBuilder: (context, i) {
                  return SizedBox(width: 1);
                },
                itemCount: top.length),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 12),
          //   child: Text(
          //     'Browse Events By Catagory',
          //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 12),
          //   child: Text(
          //     'Live Events For all your Entertainment Need',
          //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          //   ),
          // )
        ]));
  }
}

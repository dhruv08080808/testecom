import 'dart:async';

import 'package:flutter/material.dart';

class movies extends StatefulWidget {
  const movies({super.key});

  @override
  State<movies> createState() => _moviesState();
}

class _moviesState extends State<movies> {
  int _currentPage = 0;

  Timer? _timer;
  PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 350), curve: Curves.easeIn);
    });
  }

  List lan = [
    {'text': 'Hindi'},
    {'text': 'English'},
    {'text': 'Punjabi'},
    {'text': 'English 7D'},
    {'text': 'Japanese'},
    {'text': 'Malayalam'},
    {'text': 'Tamil'},
    {'text': 'Garwali'},
    {'text': 'Haryandvi'},
    {'text': 'Multi Language'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Now Showing ',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            Text(
              'Delhi | 31 Movies',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            )
          ],
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 41,
            )),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
              height: 190,
              child: PageView(controller: _pageController, children: [
                // Image.asset('lib/assets/samesize2.webp'),
                Image.asset('lib/assets/same.jpg'),
                Image.asset('lib/assets/movie.webp'),
                Image.asset('lib/assets/bannermovie.webp'),
              ])),
          SizedBox(height: 20),
          SizedBox(
            height: 30,
            width: 100,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Text(lan[i]['text'],
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center),
                  );
                },
                separatorBuilder: (context, i) {
                  return const SizedBox(
                    width: 12, //gap between boxes
                  );
                },
                itemCount: 10),
          ),
          //   SizedBox(height: 15),
          //   SizedBox(
          //     height: 80,
          //     width: 50,
          //     child: Container(
          //         padding: EdgeInsets.all(5),
          //         width: 80,
          //         decoration: BoxDecoration(color: Colors.red),
          //         child: ElevatedButton(onPressed: () {}, child: Text(''))),
          //   )
          SizedBox(height: 20),
          SizedBox(
            height: 70,
            width: 20,
            child: Container(
                //box decoration lag ni rha
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.red),
                child: Row(
                  children: [
                    Text(
                      '   Coming Soon ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      ' Explore Upcoming Movies',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_circle_right,
                      size: 40,
                      color: Colors.white,
                    )
                  ],
                )),
          ),
          SizedBox(height: 20),
          // Column(children: [
          //   Row(children: [
          //     Expanded(
          //         child: Container(
          //             margin: EdgeInsets.symmetric(horizontal: 10),
          //             // height: 300,
          //             // width: 20,
          //             child: Image.asset('lib/assets/zara.webp', height: 230))),
          //     SizedBox(width: 5),
          //     Expanded(
          //         child: Container(
          //             margin: EdgeInsets.symmetric(horizontal: 10),
          //             // height: 300,
          //             // width: 100,
          //             child: Image.asset('lib/assets/zara.webp', height: 230)))
          //   ]),
          //   SizedBox(height: 7),
          //   Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Container(
          //           padding: EdgeInsets.symmetric(horizontal: 20),
          //           margin: EdgeInsets.symmetric(horizontal: 12),
          //           height: 20,
          //           width: 150,
          //           color: Colors.grey.shade200,
          //           child: Icon(
          //             Icons.star,
          //             size: 20,
          //             color: Colors.red,
          //           ))
          //     ],
          //   )
          // ])

          Container(
              padding: EdgeInsets.only(left: 10),
              height: 300,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    return Column(children: [
                      SizedBox(
                          width: 700,
                          //  child: Image.asset('lib/assets/zara.webp', height: 170),
                          child: Column(children: [
                            //Image.asset(mov[i]['img'], height: 170),
                            Row(
                              children: [
                                Image.asset(
                                  'lib/assets/zara.webp',
                                  height: 235,
                                ),
                                SizedBox(width: 10),
                                Image.asset(
                                  'lib/assets/zara.webp',
                                  height: 235,
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Container(
                                height: 60,
                                width: 200,
                                color: Colors.blue.shade50,
                                child: Row(children: [
                                  Icon(Icons.thumb_up, size: 20),
                                  Text('18.4K Likes'),
                                ]))
                          ]))
                    ]);
                  },
                  separatorBuilder: (context, i) {
                    return SizedBox(width: 10);
                  },
                  itemCount: 10)),
        ],
      ),
    );
  }
}

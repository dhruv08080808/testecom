import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:testecom/screens/seatbook.dart';

import 'howmanytick.dart';

class dateconcept extends StatefulWidget {
  const dateconcept({super.key});

  @override
  State<dateconcept> createState() => _dateconceptState();
}

class _dateconceptState extends State<dateconcept> {
  ThemeMode _themeMode = ThemeMode.system;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  List cata = [
    {'text': '₹0-₹100'},
    {'text': '₹101-₹200'},
    {'text': '₹201-₹300'},
    {'text': '₹301-₹400'},
    {'text': '₹401-₹500'},
    {'text': '₹501-₹600'},
    {'text': '₹601-₹700'},
    {'text': '₹701-₹800'},
    {'text': '₹801-₹900'},
    {'text': '₹901-₹1000'},
  ];

  //  ---------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(children: [
              Icon(Icons.keyboard_arrow_left, size: 30, color: Colors.white),
              SizedBox(width: 5),
              Text('Zara Hatkr Zara Bachkr',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              SizedBox(width: 65),
              Icon(Icons.search, size: 30, color: Colors.white),
              SizedBox(width: 12),
              Icon(Icons.filter_alt, size: 30, color: Colors.white)
            ])),
        body: ListView(children: [
          HorizontalCalendar(
              date: DateTime.now(),
              textColor: Colors.black45,
              backgroundColor: Colors.white,
              selectedColor: Colors.red,
              showMonth: false,
              locale: Localizations.localeOf(context),
              onDateSelected: (date) {
                print(date.toString());
              }),
          // -------------------- body ------------------
          SizedBox(height: 10),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white60,
                border: Border.all(
                    color: Colors.grey.shade200,
                    width: 3.0), // Set border width
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(children: [
                Text('Hindi ',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                Text('   ',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                Text('2D ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
              ])),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white60,
                  border: Border.all(
                      color: Colors.grey.shade200,
                      width: 3.0), // Set border width
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: ListView.separated(
                  //physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Row(children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: const Color.fromARGB(179, 0, 0, 0),
                                width: 1.0),
                            color: Colors.grey.shade100,
                          ),
                          height: 20,
                          width: 90,
                          //color: Colors.amber,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(cata[i]['text'])))
                    ]);
                  },
                  separatorBuilder: (context, i) {
                    return SizedBox(width: 20);
                  },
                  itemCount: cata.length)),
          Container(
              margin: EdgeInsets.all(14),
              color: Colors.grey.shade100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(14),
                      color: Colors.grey.shade100,
                      child: mov(
                        textt: 'Delite Cinema ',
                        cancel: 'Non-Cancellable',
                      ),
                    ),
                    Row(children: [
                      MovieCard(
                        timeTxt: '6:30 PM',
                      ),
                      SizedBox(width: 20),
                      MovieCard(
                        timeTxt: '7:30 PM',
                      ),
                      SizedBox(width: 10),
                      MovieCard(
                        timeTxt: '10:30 PM',
                      ),
                    ]),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        mov(
                          textt: 'PVR: SAKET ',
                          cancel: 'Non-Cancellable',
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            MovieCard(
                              timeTxt: '8:00 PM',
                            ),
                            SizedBox(width: 20),
                            MovieCard(
                              timeTxt: '11:00 PM',
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        mov(
                          textt: 'PVR: Gaur City,Greater Noida ',
                          cancel: 'Cancellable Availabe',
                        ),
                        SizedBox(height: 10),
                        Row(children: [
                          SizedBox(width: 20),
                          MovieCard(
                            timeTxt: '6:50 PM',
                          ),
                          SizedBox(width: 20),
                          MovieCard(
                            timeTxt: '7:50 PM',
                          )
                        ])
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(children: [
                      mov(
                        textt: 'PVR: Vegas Mall ',
                        cancel: 'Cancellable Availabe',
                      ),
                      SizedBox(height: 10),
                      Row(children: [
                        MovieCard(
                          timeTxt: '9:20 PM',
                        ),
                        SizedBox(width: 20),
                        MovieCard(
                          timeTxt: '10:20 PM',
                        ),
                        SizedBox(width: 20),
                        MovieCard(
                          timeTxt: '11:20 PM',
                        )
                      ])
                    ]),
                    SizedBox(height: 20),
                    Column(children: [
                      mov(
                          textt: 'PVR: Logix Noida ',
                          cancel: 'Cancellable NotAvailabe'),
                      SizedBox(height: 10),
                      Row(children: [
                        MovieCard(timeTxt: '08:00 PM'),
                        SizedBox(width: 20),
                        MovieCard(timeTxt: '10:00 PM'),
                        SizedBox(width: 20),
                        MovieCard(timeTxt: '11:00 PM')
                      ])
                    ]),
                    SizedBox(height: 20),
                    Column(children: [
                      mov(
                        textt: 'PVR: Pacific , Subhash Nagar,Delhi ',
                        cancel: 'Cancellable Availabe',
                      ),
                      SizedBox(height: 10),
                      Row(children: [
                        MovieCard(
                            timeTxt: '09:20 PM', apTitleBottomText: 'first'),
                        SizedBox(width: 20),
                        MovieCard(
                            timeTxt: '10:20 PM', apTitleBottomText: 'second'),
                        SizedBox(width: 20),
                        MovieCard(
                            timeTxt: '11:20 PM', apTitleBottomText: 'third'),
                      ])
                    ])
                  ])),
        ]));
  }
}

// ------------------------ common widget / component --------------------
// '11:20 PM'

class MovieCard extends StatelessWidget {
  final String? timeTxt;
  final String? apTitleBottomText;
  const MovieCard({super.key, this.timeTxt, this.apTitleBottomText});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    seatbook(appSubtitle: apTitleBottomText)));
      },
      child: Container(
          width: 100,
          decoration: BoxDecoration(
              color: Colors.white60,
              border:
                  Border.all(color: Color.fromARGB(179, 0, 0, 0), width: 1.0)),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Center(
              child:
                  Text(timeTxt ?? '-', style: TextStyle(color: Colors.green)))),
    );
  }
}
//----------------------------- STATELESS COMMAN-----------

class mov extends StatelessWidget {
  final String? textt;
  final String? cancel;
  const mov({super.key, this.textt, this.cancel});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Icon(Icons.heart_broken),
            SizedBox(width: 5),
            Text(textt ?? '-',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.info),
            SizedBox(width: 3),
            Text('INFO',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
          ],
        ),
      ]),
      Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(cancel ?? '-'),
          ))
    ]);
  }
}

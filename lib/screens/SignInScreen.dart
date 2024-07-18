import 'dart:async';
import 'package:firebase_auth/';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:testecom/main.dart';
import 'package:testecom/screens/dashboardScreen.dart';
import 'package:testecom/screens/get.dart';

import 'OtpScreen.dart';

class SignInScree extends StatefulWidget {
  const SignInScree({super.key});

  @override
  State<SignInScree> createState() => _SignInScreeState();
}

class _SignInScreeState extends State<SignInScree> {
  DateTime now = DateTime.now();
  TextEditingController phone = TextEditingController();
  final controller = Get.put(LoginController());
  signupUsingNo() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${phone.text.trim()}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          print("Verification done");
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      OtpScreen(verificationId: verificationId)));
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  final selfsignupformkey = GlobalKey<FormState>();

  handle() {
    _signInWithGoogle().then((User) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => DashboardScreen()));
    });
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          prefs!.getInt('theme') == null || prefs!.getInt('theme') == 0
              ? Colors.white
              : Colors.black,
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
          SizedBox(height: 100),
          SizedBox(
              height: 182,
              child: PageView(controller: _pageController, children: [
                // Image.asset('lib/assets/samesize2.webp'),
                Column(
                  children: [
                    Image.asset(
                      'lib/assets/sign1.webp',
                      height: 130,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                          'Now Save Money On your Movie Tickets With free Discount'),
                    )
                  ],
                ),

                Column(
                  children: [
                    Image.asset(
                      'lib/assets/sign2.webp',
                      height: 130,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                          'Now Save Money On your Movie Tickets With free Discount'),
                    )
                  ],
                ),
                Column(children: [
                  Image.asset(
                    'lib/assets/sign3.webp',
                    height: 130,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                        'Now Save Money On your Movie Tickets With free Discount'),
                  )
                ])
              ])),
          Center(
              child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 5,
                    dotWidth: 5,
                    activeDotColor: Colors.black,
                    type: WormType.thinUnderground,
                  ))),
          SizedBox(height: 40),
          Center(
              child: Form(
                  key: selfsignupformkey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // color: Colors.black,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                _signInWithGoogle();
                              },
                              child: Text('Continue With Google')),
                        ),
                        SizedBox(height: 20),
                        Container(
                          // color: Colors.black,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                handle!();
                              },
                              child: Text('Continue With Email')),
                        ),
                        SizedBox(height: 10),
                        Center(
                            child: Text(
                          'OR',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        )),
                        SizedBox(height: 10),
                        Row(children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          Icon(Icons.flag),
                          Text(
                            '+91',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: phone,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Continue With mobile Number',
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 5),
                              ),
                            ),
                          ),
                        ]),
                        //SizedBox(height: 40),
                        Container(
                            child: ElevatedButton(
                                onPressed: () {
                                  // 0 --> light
                                  // 1 --> dark
                                  if (prefs!.getInt('theme') == null) {
                                    prefs!.setInt('theme', 1);
                                    setState(() {});
                                  } else {
                                    if (prefs!.getInt('theme') == 0) {
                                      prefs!.setInt('theme', 1);
                                      setState(() {});
                                    } else {
                                      prefs!.setInt('theme', 0);
                                      setState(() {});
                                    }
                                  }
                                },
                                child: Text('change theme'))),
                        // Text('PHONE NUMBER', style: TextStyle(fontSize: 18)),
                        // // TextFormField(
                        // //     controller: phone,
                        // //     keyboardType: TextInputType.number),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       if (selfsignupformkey.currentState!.validate()) {
                        //         signupUsingNo();
                        //         print("Signup successfully");
                        //       }
                        //     },
                        //     child: Text('Sign in with Mobile Number')),
                        // Text(DateFormat('dd / MM / yyy | hh:mm').format(now))
                      ]))),
        ],
      ),
    );
  }
}
//////////////------------////////////
// Obx(() {
//                                   if (controller.googleacc == null) {
//                                     return DashboardScreen();
//                                   } else {
//                                     return SignInScree();
//                                   }
//                                 });

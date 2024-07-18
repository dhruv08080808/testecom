import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testecom/ekmov.dart';
import 'package:testecom/screens/GoogleAuthentication.dart';
import 'package:testecom/screens/SignInScreen.dart';
import 'package:testecom/screens/charts.dart';
import 'package:testecom/screens/chatgpt.dart';
import 'package:testecom/screens/delhincr.dart';
import 'package:testecom/screens/end.dart';
import 'package:testecom/screens/events.dart';
import 'package:testecom/screens/howmanytick.dart';
import 'package:testecom/screens/imgg.dart';
import 'package:testecom/screens/moreLessPara.dart';
import 'package:testecom/screens/movies.dart';
import 'package:testecom/screens/mumbai.dart';
import 'package:testecom/screens/onescreen.dart';
import 'package:testecom/screens/profile.dart';
import 'package:testecom/screens/seatbook.dart';
import 'package:testecom/screens/splash.dart';
import 'package:testecom/screens/streamlib.dart';
import 'package:testecom/screens/tictoe.dart';
import 'package:testecom/screens/weather.dart';
import 'package:testecom/screens/yourorders.dart';

import 'firebase/firebase_options.dart';
import 'screens/dashboardScreen.dart';
import 'screens/dateconcept.dart';

SharedPreferences? prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        title: 'Flutter Demo',
        locale: Locale('en', ''),
        home: BottomScreen());
  }
}

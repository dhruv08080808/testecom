import 'package:flutter/material.dart';
import 'package:testecom/screens/dashboardScreen.dart';
import 'package:testecom/screens/events.dart';
import 'package:testecom/screens/live.dart';
import 'package:testecom/screens/profile.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int selectedindex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  List _pages = [DashboardScreen(), events(), profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: selectedindex,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.live_tv), label: 'Events'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile')
            ]),
        body: Center(child: _pages.elementAt(selectedindex)));
  }
}

import 'package:flutter/material.dart';
import 'package:bike_pooling/Screens/Activity.dart';
import 'package:bike_pooling/Screens/Wallet.dart';
import 'package:bike_pooling/Screens/homescreen%20.dart';
import 'package:bike_pooling/Screens/profile.dart';
import 'package:bike_pooling/Screens/services.dart';
import 'package:bike_pooling/Utils/Constants/colors.dart';

class NaviagtionMenu extends StatefulWidget {
  @override
  State<NaviagtionMenu> createState() => _NaviagtionMenuState();
}

class _NaviagtionMenuState extends State<NaviagtionMenu> {
  int myIndex = 0;

  List<Widget> widgetlist = [
    MapScreen(),
    Services(),
    Wallet(),
    Activity(),
    ProfileScreeen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: myIndex,
        children: widgetlist,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ecolor.primary,
        onTap: (value) {
          setState(() {
            myIndex = value;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Publish',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars_rounded),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

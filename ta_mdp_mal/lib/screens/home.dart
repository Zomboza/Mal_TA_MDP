import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ta_mdp_mal/screens/detail.dart';
// import 'package:http/http.dart' as http;
import 'package:ta_mdp_mal/screens/top.dart';
import 'package:ta_mdp_mal/screens/about.dart';
import 'package:ta_mdp_mal/screens/all.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    AnimePage(),
    AnimePage1(),
    AboutPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        children: _pages,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'All Time',
          ),
                    BottomNavigationBarItem(
            icon: Icon(Icons.bolt_outlined),
            label: 'Seasonal',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'About',
          ),  
        ],
        currentIndex: _selectedIndex,
        // unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
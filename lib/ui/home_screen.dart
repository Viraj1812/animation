import 'package:animation/widgets/first_screen.dart';
import 'package:animation/widgets/second_screen.dart';
import 'package:animation/widgets/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  var widgetList = [
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Animation',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: widgetList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        iconSize: 40,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.first_page),
            label: 'First',
            backgroundColor: Colors.blue.shade400,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.first_page),
            label: 'Second',
            backgroundColor: Colors.blue.shade400,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.first_page),
            label: 'Third',
            backgroundColor: Colors.blue.shade400,
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

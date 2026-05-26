import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'map_screen.dart';
import 'data_screen.dart';
import 'home_screen.dart';

class MainDashboard extends StatefulWidget{
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 242, 247),

      // --- APPBAR ---
      appBar: AppBar(
        title: Text(
          'The Bathtub Model',
          style: GoogleFonts.anta(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 1, 21, 51),
      ),

      // --- BOTTONBAR ---
      bottomNavigationBar: NavigationBar(
        height: 70,
        backgroundColor: const Color.fromARGB(255, 226, 230, 236),
        selectedIndex: currentPageIndex,
        indicatorColor: const Color.fromARGB(255, 176, 185, 200),
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.map),
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.computer),
            icon: Icon(Icons.computer_outlined),
            label: 'Data',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
        ],
      ),
      

      body: <Widget>[
        const MapScreen(),
        const DataScreen(),
        const HomeScreen(),
      ][currentPageIndex]
    );
  }
}


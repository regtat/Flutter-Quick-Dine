import 'package:flutter/material.dart';
import 'package:quick_dine/screens/kantinku.dart';
import 'package:quick_dine/screens/manage_menu.dart';

class KaryawanHome extends StatefulWidget {
  @override
  _KaryawanHomeState createState() => _KaryawanHomeState();
}

class _KaryawanHomeState extends State<KaryawanHome> {
  int currentIndex = 0;
  final List<Widget> screens = [
    KantinKu(),
    ManageMenu()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halaman Karyawan')),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_sharp), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Kantin')
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quick_dine/screens/manage_user.dart';

class KantinKu extends StatefulWidget {
  @override
  _KantinKuState createState() => _KantinKuState();
}

class _KantinKuState extends State<KantinKu> {
  int currentIndex = 0;
  final List<Widget> screens = [
    KantinKu(),
    ManageUser()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kantin')),
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

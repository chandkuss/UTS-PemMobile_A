import 'package:flutter/material.dart';
import 'kalkulator.dart';
import 'login.dart';
import 'profil.dart';

class TampilanPage extends StatefulWidget {
  @override
  _TampilanPageState createState() => _TampilanPageState();
}

class _TampilanPageState extends State<TampilanPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/itenas.png', // Sesuaikan path dengan lokasi gambar kampus
          width: 200,
          height: 200,
        ),
        SizedBox(height: 20),
        Text(
          'Copyright © 2023 Chandra Kusuma Johan',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    ),
    KalkulatorPage(),
    ProfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UTS',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Log Out'),
                      content: Text('Apakah Anda yakin ingin keluar?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Batal'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text('Ya'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              ),
              child: Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.deepOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.transparent,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

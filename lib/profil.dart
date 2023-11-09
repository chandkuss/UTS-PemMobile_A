import 'package:flutter/material.dart';
import 'hobbies.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.deepOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/foto.jpg'), // Ganti dengan path foto Anda
              ),
              SizedBox(height: 20),
              Text(
                'Chandra Kusuma Johan',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                '992023042',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {

                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HobbiesPage(),
                    ),
                  );
                  // Tambahkan logika atau pindah ke layar hobi di sini
                },
                child: Text('My Galery'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

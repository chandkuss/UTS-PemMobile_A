import 'package:flutter/material.dart';

class HobbiesPage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    // Tambahkan path gambar lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Galery'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.deepOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom dalam grid
            crossAxisSpacing: 8.0, // Spasi antar kolom
            mainAxisSpacing: 8.0, // Spasi antar baris
          ),
          itemCount: imagePaths.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              imagePaths[index],
              fit: BoxFit.cover, // Atur agar gambar sesuai dengan kotaknya
              width: 10, // Sesuaikan dengan lebar yang diinginkan
              height: 10, // Sesuaikan dengan tinggi yang diinginkan
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tambahkan delay menggunakan Timer
    Future.delayed(
      Duration(seconds: 5), // Sesuaikan dengan durasi splash screen
      () {
        // Pindah ke halaman utama atau halaman berikutnya
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/itenas.png',
              width: 100, // Sesuaikan dengan lebar yang diinginkan
              height: 100, // Sesuaikan dengan tinggi yang diinginkan
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(), // Tambahkan animasi loading di bawah gambar
          ],
        ),
      ),
    );
  }
}

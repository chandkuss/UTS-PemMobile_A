import 'package:flutter/material.dart';
import 'bmi_result_screen.dart';

class KalkulatorPage extends StatefulWidget {
  @override
  _KalkulatorPageState createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmiResult = 0.0;
  String resultDescription = '';

  void _calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      setState(() {
        bmiResult = weight / ((height / 100) * (height / 100));
        resultDescription = _getBMIResultDescription(bmiResult);
      });

      // Pindah ke layar baru untuk menampilkan hasil
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BMIResultScreen(
            bmiResult: bmiResult,
            resultDescription: resultDescription,
          ),
        ),
      );
    }
  }

  String _getBMIResultDescription(double bmi) {
    // Logika untuk menentukan deskripsi berdasarkan BMI
    if (bmi < 18.5) {
      return 'Kurus';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal (Ideal)';
    } else {
      return 'Gemuk';
    }
  }

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Berat (kg)',
                  fillColor: Colors.white,
                  filled: true,
                  labelStyle: TextStyle(color: const Color.fromARGB(255, 116, 114, 114)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Tinggi (cm)',
                  fillColor: Colors.white,
                  filled: true,
                  labelStyle: TextStyle(color: Color.fromARGB(255, 116, 114, 114)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateBMI,
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                child: Text('Hitung BMI'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

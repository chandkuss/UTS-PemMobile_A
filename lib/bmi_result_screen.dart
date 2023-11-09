import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final double bmiResult;
  final String resultDescription;

  BMIResultScreen({required this.bmiResult, required this.resultDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI Result',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Your BMI: ${bmiResult.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Result: $resultDescription',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

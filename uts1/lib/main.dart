import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _tinggiController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();

  double _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Silahkan Masukkan Tinggi Badan Anda',
                icon: Icon(Icons.trending_up),
              ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: _beratController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Silahkan Masukkan Berat Badan Anda',
                icon: Icon(Icons.line_weight),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(
                "Hitung",
                style: TextStyle(color: Colors.orange),
              ),
              onPressed: calculateBMI,
            ),
            SizedBox(height: 20),
            Text(
              _result == null ? "Enter Value" : "${_result.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.black26,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(_tinggiController.text) / 100;
    double weight = double.parse(_beratController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;
    setState(() {});
  }
}

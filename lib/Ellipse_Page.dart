import 'package:flutter/material.dart';
import 'dart:math';


class EllipsePage extends StatefulWidget {
  const EllipsePage({super.key});


  @override
  State<EllipsePage> createState() => EllipsePageState();
}


class EllipsePageState extends State<EllipsePage> {
  double _a = 0;     // กึ่งแกนยาว
  double _b = 0;     // กึ่งแกนสั้น
  double _area = 0;


  final TextEditingController _aCtrl = TextEditingController();
  final TextEditingController _bCtrl = TextEditingController();


  final InputDecoration _textFieldStyle = const InputDecoration(
    filled: true,
    fillColor: Colors.blueAccent,
    border: OutlineInputBorder(),
  );


  void _calEllipse() {
    setState(() {
      _a = double.tryParse(_aCtrl.text) ?? 0;
      _b = double.tryParse(_bCtrl.text) ?? 0;
      _area = pi * _a * _b;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("คำนวณพื้นที่วงรี"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "กึ่งแกนยาว $_a ม. กึ่งแกนสั้น $_b ม.\nพื้นที่ = ${_area.toStringAsFixed(2)} ตร.ม.",
              style: const TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _aCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(
                labelText: "กึ่งแกนยาว ",
                hintText: "กรอกค่า ",
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _bCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(
                labelText: "กึ่งแกนสั้น ",
                hintText: "กรอกค่า ",
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calEllipse,
              child: const Text("คำนวณ"),
            ),
          ],
        ),
      ),
    );
  }
}

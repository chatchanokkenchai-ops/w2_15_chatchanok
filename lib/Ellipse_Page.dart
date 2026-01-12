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


  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,
    fillColor: const Color(0xfff0f8ff), // ฟ้าอ่อนสบายตา

    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Color(0xff53d2dc),
        width: 1.2,
      ),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Color(0xff4f8fc0),
        width: 2,
      ),
    ),

    labelStyle: const TextStyle(
      color: Color(0xff26648e),
      fontWeight: FontWeight.w500,
    ),

    floatingLabelStyle: const TextStyle(
      color: Color(0xff4f8fc0),
      fontWeight: FontWeight.w600,
    ),

    hintStyle: TextStyle(
      color: Colors.blueGrey.shade300,
      fontSize: 14,
    ),

    prefixIcon: const Icon(
      Icons.edit,
      color: Color(0xff4f8fc0),
    ),
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
                hintText: "กรอกค่า",
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

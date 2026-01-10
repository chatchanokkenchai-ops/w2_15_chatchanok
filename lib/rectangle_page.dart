import 'package:flutter/material.dart';


class RectanglePage extends StatefulWidget {
  const RectanglePage({super.key});


  @override
  State<RectanglePage> createState() => RectanglePageState();
}


class RectanglePageState extends State<RectanglePage> {
  int _width = 0;
  int _length = 0;
  int _area = 0;


  final TextEditingController _widthCtrl = TextEditingController();
  final TextEditingController _lengthCtrl = TextEditingController();


  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.blueAccent,
    border: OutlineInputBorder(),
  );


  void _calRectangle() {
    setState(() {
      _width = int.tryParse(_widthCtrl.text) ?? 0;
      _length = int.tryParse(_lengthCtrl.text) ?? 0;
      _area = _width * _length;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("คำนวณพื้นที่สี่เหลี่ยม"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "กว้าง $_width ม. ยาว $_length ม. พื้นที่คือ $_area ตร.ม.",
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _widthCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(
                labelText: "ความกว้าง",
                hintText: "กรอกความกว้าง",
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _lengthCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(
                labelText: "ความยาว",
                hintText: "กรอกความยาว",
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calRectangle,
              child: const Text("คำนวณ"),
            ),
          ],
        ),
      ),
    );
  }
}

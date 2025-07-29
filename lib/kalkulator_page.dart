import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController angka1Controller = TextEditingController();
  final TextEditingController angka2Controller = TextEditingController();
  String hasil = '';

  void hitung(String operator) {
    final num1 = double.tryParse(angka1Controller.text);
    final num2 = double.tryParse(angka2Controller.text);

    if (num1 == null || num2 == null) {
      setState(() {
        hasil = 'Input tidak valid';
      });
      return;
    }

    double res;
    switch (operator) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case '*':
        res = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          setState(() {
            hasil = 'Tidak bisa bagi 0';
          });
          return;
        }
        res = num1 / num2;
        break;
      default:
        return;
    }

    setState(() {
      hasil = res.toString();
    });
  }

  void reset() {
    angka1Controller.clear();
    angka2Controller.clear();
    setState(() {
      hasil = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kalkulator')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: angka1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Angka 1'),
            ),
            TextField(
              controller: angka2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Angka 2'),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => hitung('+'), child: Text('+')),
                ElevatedButton(onPressed: () => hitung('-'), child: Text('-')),
                ElevatedButton(onPressed: () => hitung('*'), child: Text('*')),
                ElevatedButton(onPressed: () => hitung('/'), child: Text('/')),
              ],
            ),
            SizedBox(height: 20),
            Text('Hasil: $hasil'),
            SizedBox(height: 10),
            ElevatedButton(onPressed: reset, child: Text('Reset')),
          ],
        ),
      ),
    );
  }
}

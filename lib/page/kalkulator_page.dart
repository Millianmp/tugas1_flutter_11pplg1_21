import 'package:flutter/material.dart';
import 'package:project1/widgets/widget_button_kalkulator.dart';

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
      setState(() => hasil = 'Input tidak valid');
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
          setState(() => hasil = 'Tidak bisa bagi 0');
          return;
        }
        res = num1 / num2;
        break;
      default:
        return;
    }

    setState(() => hasil = res.toString());
  }

  void reset() {
    angka1Controller.clear();
    angka2Controller.clear();
    setState(() => hasil = '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Modular')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: WidgetButtonKalkulator(
          angka1Controller: angka1Controller,
          angka2Controller: angka2Controller,
          hasil: hasil,
          onTambah: () => hitung('+'),
          onKurang: () => hitung('-'),
          onKali: () => hitung('*'),
          onBagi: () => hitung('/'),
          onReset: reset,
        ),
      ),
    );
  }
}

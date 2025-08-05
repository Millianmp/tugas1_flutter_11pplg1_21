import 'package:flutter/material.dart';

class WidgetButtonKalkulator extends StatelessWidget {
  final TextEditingController angka1Controller;
  final TextEditingController angka2Controller;
  final String hasil;

  final VoidCallback onTambah;
  final VoidCallback onKurang;
  final VoidCallback onKali;
  final VoidCallback onBagi;
  final VoidCallback onReset;

  const WidgetButtonKalkulator({
    super.key,
    required this.angka1Controller,
    required this.angka2Controller,
    required this.hasil,
    required this.onTambah,
    required this.onKurang,
    required this.onKali,
    required this.onBagi,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Input 1
        TextField(
          controller: angka1Controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Angka 1',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),

        // Input 2
        TextField(
          controller: angka2Controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Angka 2',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),

        // Tombol kalkulator (2x2 grid)
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2.5,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ElevatedButton(onPressed: onTambah, child: const Text('+', style: TextStyle(fontSize: 24))),
            ElevatedButton(onPressed: onKurang, child: const Text('-', style: TextStyle(fontSize: 24))),
            ElevatedButton(onPressed: onKali, child: const Text('×', style: TextStyle(fontSize: 24))),
            ElevatedButton(onPressed: onBagi, child: const Text('÷', style: TextStyle(fontSize: 24))),
          ],
        ),

        const SizedBox(height: 20),

        // Hasil
        Text(
          'Hasil: $hasil',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // Tombol Reset
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onReset,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Reset', style: TextStyle(fontSize: 18)),
          ),
        ),
      ],
    );
  }
}

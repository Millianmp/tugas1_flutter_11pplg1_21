import 'package:flutter/material.dart';

class MyCalcu extends StatefulWidget {
  const MyCalcu({super.key});

  @override
  State<MyCalcu> createState() => _MyCalcuState();
}

class _MyCalcuState extends State<MyCalcu> {
  // Controllers untuk mengambil teks dari TextField
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();

  // Variabel untuk menyimpan hasil perhitungan atau pesan status
  String _statusMessage = 'Masukkan angka dan pilih operasi.';

  @override
  void dispose() {
   
    _number1Controller.dispose();
    _number2Controller.dispose();
    super.dispose();
  }

  // Helper function to show a SnackBar (similar to LoginPage)
  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Fungsi untuk melakukan operasi matematika
  void _calculate(String operation) {
    // Mengambil nilai dari TextField dan mencoba mengonversinya ke double
    final double? num1 = double.tryParse(_number1Controller.text);
    final double? num2 = double.tryParse(_number2Controller.text);

    // Memeriksa apakah input adalah angka yang valid
    if (num1 == null || num2 == null) {
      setState(() {
        _statusMessage = 'Input tidak valid! Harap masukkan angka.';
      });
      _showSnackBar('Input tidak valid! Harap masukkan angka.', Colors.red);
      return;
    }

    double calculatedResult;
    String currentStatus;

    switch (operation) {
      case '+':
        calculatedResult = num1 + num2;
        currentStatus = 'Hasil Penjumlahan:';
        break;
      case '-':
        calculatedResult = num1 - num2;
        currentStatus = 'Hasil Pengurangan:';
        break;
      case '*':
        calculatedResult = num1 * num2;
        currentStatus = 'Hasil Perkalian:';
        break;
      case '/':
        if (num2 == 0) {
          setState(() {
            _statusMessage = 'Tidak bisa dibagi nol!'; // Menangani pembagian dengan nol
          });
          _showSnackBar('Tidak bisa dibagi nol!', Colors.orange);
          return;
        }
        calculatedResult = num1 / num2;
        currentStatus = 'Hasil Pembagian:';
        break;
      default:
        calculatedResult = 0; // Default jika operasi tidak dikenal
        currentStatus = 'Operasi tidak dikenal.';
    }

    // Memperbarui state untuk menampilkan hasil
    setState(() {
      _statusMessage = '$currentStatus ${calculatedResult.toStringAsFixed(2)}'; // Menampilkan hasil dengan 2 angka di belakang koma
    });
    _showSnackBar('Perhitungan berhasil!', Colors.green);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Sederhana'), // Judul AppBar
        backgroundColor: Colors.blueAccent, // Warna latar belakang AppBar
        foregroundColor: Colors.white, // Warna teks AppBar
      ),
      body: Container( // Menggunakan Container seperti di LoginPage
        margin: const EdgeInsets.all(16.0), // Margin di sekitar konten
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Meregangkan elemen secara horizontal
          children: [
            // Judul dan deskripsi (mirip dengan "Welcome to our first app!")
            const Text(
              "Selamat Datang di Kalkulator!",
              style: TextStyle(
                fontSize: 24,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text("Silakan masukkan dua angka dan pilih operasi."),
            const SizedBox(height: 20),

            // TextField untuk angka pertama
            Container( // Membungkus TextField dengan Container untuk margin
              margin: const EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: _number1Controller,
                keyboardType: TextInputType.number, // Mengatur keyboard hanya untuk angka
                decoration: const InputDecoration( // Menggunakan const untuk optimasi
                  labelText: 'Angka 1', // Label untuk input
                  border: OutlineInputBorder(), // Border standar seperti LoginPage
                  hintText: 'Masukkan angka pertama', // Placeholder
                ),
              ),
            ),

            // TextField untuk angka kedua
            Container( // Membungkus TextField dengan Container untuk margin
              margin: const EdgeInsets.only(bottom: 30),
              child: TextField(
                controller: _number2Controller,
                keyboardType: TextInputType.number, // Mengatur keyboard hanya untuk angka
                decoration: const InputDecoration( // Menggunakan const untuk optimasi
                  labelText: 'Angka 2', // Label untuk input
                  border: OutlineInputBorder(), // Border standar seperti LoginPage
                  hintText: 'Masukkan angka kedua', // Placeholder
                ),
              ),
            ),

            // Baris tombol operasi
            Container( // Membungkus Row dengan Container untuk margin
              margin: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // Meratakan tombol
                children: [
                  _buildOperationButton('+', Colors.green), // Tombol tambah
                  _buildOperationButton('-', Colors.red), // Tombol kurang
                  _buildOperationButton('*', Colors.orange), // Tombol kali
                  _buildOperationButton('/', Colors.purple), // Tombol bagi
                ],
              ),
            ),

            // Teks untuk menampilkan hasil atau status
            Center( // Menggunakan Center seperti di LoginPage untuk status
              child: Text(
                _statusMessage, // Menampilkan hasil atau pesan status
                textAlign: TextAlign.center, // Teks di tengah
                style: TextStyle(
                  fontSize: 24, // Ukuran font besar
                  fontWeight: FontWeight.bold, // Tebal
                  color: _statusMessage.contains('valid') || _statusMessage.contains('nol')
                      ? Colors.red.shade700 // Warna merah untuk error
                      : Colors.deepPurple, // Warna ungu untuk hasil normal
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pembantu untuk membuat tombol operasi
  Widget _buildOperationButton(String operation, Color color) {
    return Expanded( // Menggunakan Expanded agar tombol mengisi ruang yang tersedia
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0), // Padding horizontal antar tombol
        child: ElevatedButton(
          onPressed: () => _calculate(operation), // Memanggil _calculate saat tombol ditekan
          style: ElevatedButton.styleFrom(
            backgroundColor: color, // Warna latar belakang tombol
            foregroundColor: Colors.white, // Warna teks tombol
            padding: const EdgeInsets.symmetric(vertical: 15), // Padding internal tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Sudut membulat
            ),
            textStyle: const TextStyle(
              fontSize: 24, // Ukuran font teks tombol
              fontWeight: FontWeight.bold, // Tebal
            ),
            elevation: 5, // Efek bayangan
          ),
          child: Text(operation), // Teks tombol (misalnya "+", "-", dll.)
        ),
      ),
    );
  }
}
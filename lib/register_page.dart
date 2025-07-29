import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? jenisKelamin;
  DateTime? tanggalLahir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register KFC')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email / Username'),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: jenisKelamin,
              decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
              items: const [
                DropdownMenuItem(value: 'Laki-laki', child: Text('Laki-laki')),
                DropdownMenuItem(value: 'Perempuan', child: Text('Perempuan')),
              ],
              onChanged: (value) {
                setState(() {
                  jenisKelamin = value;
                });
              },
            ),
            const SizedBox(height: 15),
            ListTile(
              title: Text(
                tanggalLahir == null
                    ? 'Pilih Tanggal Lahir'
                    : 'Tanggal Lahir: ${tanggalLahir!.day}-${tanggalLahir!.month}-${tanggalLahir!.year}',
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2008),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() {
                    tanggalLahir = picked;
                  });
                }
              },
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                // register logic
              },
              child: const Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}

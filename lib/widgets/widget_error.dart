import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  final String message;

  const CustomErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(color: Colors.red),
    );
  }
}

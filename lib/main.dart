import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Pastikan path ke file login_screen benar

void main() {
  runApp(BrainlyApp());
}

class BrainlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brainly Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Halaman awal adalah LoginScreen
    );
  }
}

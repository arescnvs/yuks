import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

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
      home: HomeScreen(),
    );
  }
}

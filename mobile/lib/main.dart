import 'presentation/screens/main_dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bathtub Model',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 33, 81, 120),
          primary: const Color.fromARGB(255, 0, 10, 18),
        ),
        useMaterial3: true,
      ),
      home: const MainDashboard(),
    );
  }
}

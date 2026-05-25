import 'package:bathtub_models/presentation/screens/exact_location_map_screen.dart';
import 'package:bathtub_models/presentation/screens/tub_location_map_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bathtub Models'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: ExactLocationMapScreen(),
          ),
          SizedBox(height: 4),
          Expanded(
            child: TubLocationMapScreen(),
          ),
        ],
      ),
    );
  }
}

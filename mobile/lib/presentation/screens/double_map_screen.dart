import 'package:bathtub_models/presentation/screens/tub_location_map_screen.dart';
import 'package:flutter/material.dart';

import 'exact_location_map_screen.dart';

class DoubleMapScreen extends StatelessWidget {
  const DoubleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bathtub Model vs Raw GPS'),
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

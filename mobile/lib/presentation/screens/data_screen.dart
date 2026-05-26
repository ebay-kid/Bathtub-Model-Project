import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '1. For each individual: Collect their trip remaining time\n'
                'If the destination is within the bathtub area, remaining time = time needed to end the trip.\n'
                'If the destination is outside the bathtub area, remaining time = time needed to exit the bathtub area.',
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '2. For the overall bathtub model:\n'
                'At time t (i.e. right now):\n'
                '(1) How many cars have already entered before time t?\n'
                '(2) How many cars are entering at time t?\n'
                '(3) How many cars are leaving at time t?',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

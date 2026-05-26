import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 242, 247),
        appBar: AppBar(
          title: Text(
            'Home',
            style: GoogleFonts.electrolize(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),


      body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Home'),
        ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sep7a_app/home_page.dart';

void main() {
  runApp(const Sup7a());
}

class Sup7a extends StatelessWidget {
  const Sup7a({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

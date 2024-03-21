import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Colors.red.shade800;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.color_lens,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(34, (index) {
              return Container(
                width: double.infinity,
                height: 80.0,
                margin: EdgeInsets.only(bottom: 8.0),
                color: Colors.green,
              );
            }),
          ),
        ),
      ),
    );
  }
}

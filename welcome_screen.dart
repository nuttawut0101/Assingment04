// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_assigment04/app_route.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _navigateBMI(context) async {
    Navigator.pushReplacementNamed(context, AppRouter.bmi);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: TextStyle(
        fontSize: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      backgroundColor: Color.fromARGB(255, 170, 0, 31),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 220,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: style,
              onPressed: () => _navigateBMI(context),
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.yellowAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

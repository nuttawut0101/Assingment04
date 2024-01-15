// ignore_for_file: prefer_const_constructors

import 'package:flutter_assigment04/bmi_screen.dart';
import 'package:flutter_assigment04/welcome_screen.dart';

class AppRouter {
  // Router map keys

  static const String welcome = "welcome";
  static const String bmi = "bmi";

  static get routes => {
        welcome: (context) => WelcomeScreen(),
        bmi: (context) => BMIScreen(),
      };
}

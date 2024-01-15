// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_assigment04/bmi_service.dart';
import 'package:flutter_assigment04/icon_button.dart';
import 'package:flutter_assigment04/textfield.dart';
import 'package:get/get.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiService = Get.put(BMIService());

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
      appBar: AppBar(
        title: Text(
          "BMI Calulator",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "BMI Calulator",
              style: TextStyle(
                color: Colors.purpleAccent,
                  fontSize: 30, fontWeight: FontWeight.w500, letterSpacing: 3),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        onPressed: () => bmiService.incrmentHeight(),
                        iconData: Icons.remove,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          child: CustomTextField(
                            labelText: "height",
                            controller: bmiService.heightTextField,
                            onChanged: (text) => bmiService.setHeight(
                              int.parse(text),
                            ),
                          ),
                        ),
                      ),
                      CustomIconButton(
                        onPressed: () => bmiService.decrementHeight(),
                        iconData: Icons.add,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        onPressed: () => bmiService.decrementWeight(),
                        iconData: Icons.remove,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          child: CustomTextField(
                            labelText: "weight",
                            controller: bmiService.weightTextField,
                            onChanged: (text) => bmiService.setWeight(
                              int.parse(text),
                            ),
                          ),
                        ),
                      ),
                      CustomIconButton(
                        onPressed: () => bmiService.incrmentWeight(),
                        iconData: Icons.add,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: style,
                onPressed: () => {
                  bmiService.bmiCalculate(),
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Align(
                        alignment: FractionalOffset.center,
                        child: Text(
                            'YourBMI  ${bmiService.bmi.toStringAsFixed(2)}'),
                      ),
                      actions: <Widget>[
                        Center(
                          child: TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ),
                      ],
                    ),
                  ),
                },
                child: const Text(
                  'Calulate',
                  style: TextStyle(color: Colors.yellowAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

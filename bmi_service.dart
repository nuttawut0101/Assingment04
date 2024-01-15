import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMIService extends GetxController {
  RxInt weight = 50.obs;
  RxInt height = 160.obs;
  RxDouble bmi = 0.0.obs;

  final weightTextField = TextEditingController();
  final heightTextField = TextEditingController();

  void setWeight(int value) {
    weight.value = value;
  }

  void setHeight(int value) {
    height.value = value;
  }

  void incrmentWeight() {
    weight++;
    weightTextField.text = weight.value.toString();
  }

  void decrementWeight() {
    weight--;
    weightTextField.text = weight.value.toString();
  }

  void incrmentHeight() {
    height++;
    heightTextField.text = height.value.toString();
  }

  void decrementHeight() {
    height--;
    heightTextField.text = height.value.toString();
  }

  void bmiCalculate() {
    bmi.value = weight / ((height / 100) * (height / 100));
  }
}

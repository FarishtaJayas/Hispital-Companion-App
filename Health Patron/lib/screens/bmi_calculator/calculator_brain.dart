import 'dart:math';

class CalculatorBrian {
  CalculatorBrian({this.weight, this.height});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25.0) {
      return 'Your body weight is very high, please exercise';
    } else if (_bmi > 18.5) {
      return 'You are doing great. Keep it up! ';
    } else {
      return 'Your body weight is very low. Please eat more';
    }
  }
}

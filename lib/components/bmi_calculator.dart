import 'dart:math';
import 'package:flutter/cupertino.dart';

class BmiCalculator{

  final int height;
  final int weight;
  double _bmi;
  BmiCalculator({@required this.height,@required this.weight});

  String calculateBmi (){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getAnswer(){
    if(_bmi >= 25)
      return "OverWeight";
    else if (_bmi >= 18.5)
      return "Normal";
    else
      return "UnderWeight";
  }

  String getMessage(){
    if(_bmi >= 25)
      return "You have a higer than normal body weight. Try to exercise more";
    else if (_bmi >= 18.5)
      return "You have normal boy weight. Good job!";
    else
      return "You have a lower than normal body weight. Try to eat more";
  }
}
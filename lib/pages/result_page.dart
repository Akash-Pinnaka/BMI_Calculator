import 'dart:ui';
import 'package:bmi_calculator/pages/input_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../components/Cards.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.answer, @required this.bmiResult, @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Cards(
              color: activeCardColor,
              data: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    answer,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF24D878),
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    resultText.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 70.0,
              width: double.infinity,
              color: bottomContainerColor,
              child: Center(
                child: Text(
                  "Re-Calculate",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


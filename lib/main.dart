import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Cards.dart';
import 'CardsData.dart';

const activeCardColor = Color(0xFF1D1F33);
const bottomContainerColor = Color(0xFFEA1556);
const inactiveCardColor = Color(0xFF111328);

enum Gender {Male,Female}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090C22),
        scaffoldBackgroundColor: Color(0xFF090C22),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                       selectedGender=Gender.Male;
                      });
                    },
                    child: Cards(
                      data: CardsData(
                        label: "MALE",
                        icon: FontAwesomeIcons.mars,
                      ),
                      color: selectedGender==Gender.Male?activeCardColor:inactiveCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender=Gender.Female;
                      });
                    },
                    child: Cards(
                      data: CardsData(
                        label: "FEMALE",
                        icon: FontAwesomeIcons.venus,
                      ),
                      color: selectedGender==Gender.Female?activeCardColor:inactiveCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Cards(
              color: activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Cards(
                    color: activeCardColor,
                  ),
                ),
                Expanded(
                  child: Cards(
                    color: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80.0,
            width: double.infinity,
            color: bottomContainerColor,
            child: Center(
              child: Text(
                "Calculate BMI",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

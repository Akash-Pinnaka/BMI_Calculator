import 'dart:ui';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/Cards.dart';
import '../components/CardsData.dart';
import '../components/bmi_calculator.dart';

const activeCardColor = Color(0xFF1D1F33);
const bottomContainerColor = Color(0xFFEA1556);
const inactiveCardColor = Color(0xFF111328);

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 160;
  int weight = 50;
  int age = 18;

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
                  child: Cards(
                    function: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    data: CardsData(
                      label: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                    color: selectedGender == Gender.Male
                        ? activeCardColor
                        : inactiveCardColor,
                  ),
                ),
                Expanded(
                  child: Cards(
                    function: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    data: CardsData(
                      label: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                    color: selectedGender == Gender.Female
                        ? activeCardColor
                        : inactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Cards(
              data: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kDataStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kDataStyle.copyWith(
                          fontSize: 60,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "CM",
                        style: kDataStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                    ),
                    child: Slider(
                      min: 100.0,
                      max: 210.0,
                      value: height.toDouble(),
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              color: activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Cards(
                    data: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: kDataStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 60,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (weight > 1) weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    color: activeCardColor,
                  ),
                ),
                Expanded(
                  child: Cards(
                    data: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: kDataStyle,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 60,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (age >= 19) age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    color: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BmiCalculator calc =
                  BmiCalculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBmi(),
                    answer: calc.getAnswer(),
                    resultText: calc.getMessage(),
                  )
                ),
              );
            },
            child: Container(
              height: 70.0,
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
            ),
          )
        ],
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 10.0,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Cards.dart';
import 'CardsData.dart';
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
                    data: CardsData(label: "MALE",icon: FontAwesomeIcons.mars,),
                    color: Color(0xFF1D1F33),
                  ),
                ),
                Expanded(
                  child: Cards(
                    data: CardsData(label: "FEMALE",icon: FontAwesomeIcons.venus,),
                    color: Color(0xFF1D1F33),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Cards(
              color: Color(0xFF1D1F33),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Cards(
                    color: Color(0xFF1D1F33),
                  ),
                ),
                Expanded(
                  child: Cards(
                    color: Color(0xFF1D1F33),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




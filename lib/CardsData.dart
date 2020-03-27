import 'package:flutter/material.dart';

const kDataStyle = TextStyle(
  fontSize: 18,
);
class CardsData extends StatelessWidget {

  final String label;
  final IconData icon;

  CardsData({this.label,this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kDataStyle,
        )
      ],
    );
  }
}
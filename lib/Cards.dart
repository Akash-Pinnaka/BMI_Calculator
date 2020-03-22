import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final Color color;
  final Widget data;
  Cards({@required this.color, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: data,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
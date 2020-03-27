import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final Color color;
  final Widget data;
  final Function function;
  Cards({@required this.color, this.data,this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        child: data,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
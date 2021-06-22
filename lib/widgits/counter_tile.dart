import 'package:flutter/material.dart';

Widget counterTile({int valueToShow,IconData iconToShow}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        iconToShow,
        color: Colors.black87,
      ),
      Text(
        '$valueToShow',
        overflow: TextOverflow.fade,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}
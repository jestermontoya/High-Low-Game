import 'package:flutter/material.dart';

Widget reCards(double height, double width, String card){
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
      height: height,
      width: width,
      child: Image.asset(card),
    ),
  );
}

Widget btns(String txtButton){
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
      child: Center(
        child: Text(txtButton, textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      height: 90,
      width: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 2, 97, 2), Color.fromARGB(255, 114, 167, 67)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        )
      ),
    ),
  );
}

TextStyle scoreStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Colors.white
);
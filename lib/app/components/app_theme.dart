import 'package:flutter/material.dart';

const Color mainColor = Color.fromARGB(255, 238, 104, 118); //EE6876
const Color topColor = Color.fromARGB(255, 252, 104, 97);
const Color bottomColor = Color.fromARGB(255, 215, 65, 119);
const Color textColor = Color.fromARGB(255, 68, 68, 68);

const TextStyle textStyleLarge = TextStyle(fontSize: 15, color: textColor);
const TextStyle textStyleMedium = TextStyle(fontSize: 13, color: textColor);
const TextStyle textStyleSmall = TextStyle(fontSize: 11, color: textColor);

const LinearGradient buttonGradient = LinearGradient(
    colors: [topColor, bottomColor],
    begin: Alignment(0, -1),
    end: Alignment(0, 1));

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color mainColor = Color.fromARGB(255, 48, 190, 118);
const Color signInBackGroundColor = Color.fromARGB(255, 242, 242, 242); //EE6876
const Color topColor = Color.fromARGB(255, 255, 255, 255);
const Color bottomColor = Color.fromARGB(255, 255, 255, 255);
const Color textColor = Color.fromARGB(255, 3, 15, 9);

const TextStyle textStyleLarge = TextStyle(fontSize: 15, color: textColor);
const TextStyle textStyleMedium = TextStyle(fontSize: 13, color: textColor);
const TextStyle textStyleSmall = TextStyle(fontSize: 11, color: textColor);
TextStyle textStyleApp = GoogleFonts.nunito(
    textStyle: const TextStyle(
  color: Color.fromARGB(255, 3, 15, 9),
));
const LinearGradient buttonScratchGradient = LinearGradient(
    colors: [mainColor, mainColor],
    begin: Alignment(0, -1),
    end: Alignment(0, 1));
const LinearGradient buttonGradient = LinearGradient(
    colors: [topColor, bottomColor],
    begin: Alignment(0, -1),
    end: Alignment(0, 1));

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _primaryColour = const Color(0xFF000000);
final _secondaryColour = const Color(0xFFFF6600);
final _accentColour = const Color(0xFF1c1c1c);
final _highlightColour = const Color(0xFFFFFFFF);
final _reverseTextColour = const Color(0xFFC8C8C8);
final _transparentColour = const Color(0x00006600);
final _indicator1Colour = const Color(0xFF4CBB17); //Kelly Green
final _indicator2Colour = const Color(0xFFFF7800); //Safety Orange
final _indicator3Colour = const Color(0xFFE60000); //Electric Red
// final _indicator1Colour = const Color(0xFF26FF03);
// final _indicator2Colour = const Color(0xFFFF6600);
// final _indicator3Colour = const Color(0xFFFF0000);

final backgroundColour = _primaryColour;
final borderColour = _secondaryColour;
final iconColour = _secondaryColour;
final fadeColour = _primaryColour;
final transparentColour = _transparentColour;
final dollarColour = _primaryColour;
final reverseDollarColour = _reverseTextColour;
final primaryColour = _primaryColour;
final secondaryColour = _secondaryColour;
final textInputColour = _highlightColour;

final indicator1 = _indicator1Colour;
final indicator2 = _indicator2Colour;
final indicator3 = _indicator3Colour;

class MyTheme {
  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: _primaryColour,
      cardColor: _secondaryColour,
      primaryColor: _primaryColour,
      buttonColor: _secondaryColour,
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: _primaryColour),
        headline2: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: _secondaryColour),
        headline3: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: _secondaryColour),
        headline4: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: _secondaryColour),
        headline5: TextStyle(
            fontSize: 10.0, fontWeight: FontWeight.bold, color: _primaryColour),
        headline6: TextStyle(
            fontSize: 8.0, fontWeight: FontWeight.bold, color: _primaryColour),
        bodyText1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: _secondaryColour),
        bodyText2: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: _secondaryColour),
        subtitle1: TextStyle(
            fontSize: 12.0, fontWeight: FontWeight.bold, color: _primaryColour),
        subtitle2: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: reverseDollarColour),
        button: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.bold, color: _primaryColour),
      ),
      appBarTheme: AppBarTheme(
        color: _primaryColour,
        brightness: Brightness.light,
        elevation: 0,
      ),
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        height: 40.0,
        buttonColor: _secondaryColour,
        splashColor: _accentColour,
        highlightColor: _highlightColour,
      ),
      cardTheme: CardTheme(
          color: _primaryColour,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
  }
}

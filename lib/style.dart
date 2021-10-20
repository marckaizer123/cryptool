import 'package:flutter/material.dart';

const LargeTextSize = 26.0;
const MediumTextSize = 20.0;
const BodyTextSize = 16.0;

const String FontNameDefault = 'Montserrat';

const AppBarTextStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w300,
    fontSize: MediumTextSize,
    color: Colors.black);

const TitleTextStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w300,
    fontSize: LargeTextSize,
    color: Colors.black);

const TitleTextStyle2 = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w300,
    fontSize: LargeTextSize,
    color: Colors.white);

const BodyTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: BodyTextSize,
  color: Colors.black,
);

class StyleMaker {
  static TextStyle bodyTextStyle([Color color, FontWeight fontWeight]) {
    return TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: fontWeight ?? FontWeight.w300,
      fontSize: BodyTextSize,
      color: color ?? Colors.black,
    );
  }

  static TextStyle buttonTextStyle({
    Color fontColor,
    FontWeight fontWeight,
    double fontSize,
  }) {
    return TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: fontWeight ?? FontWeight.w300,
      fontSize: fontSize ?? MediumTextSize,
      color: fontColor ?? Colors.black,
    );
  }
}

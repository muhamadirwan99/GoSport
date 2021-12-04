import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color secondaryColor = Color(0xff95fe84);
const Color bottomNav = Color(0xff03fc35);
double defaultMargin = 30.0;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.bold;
TextStyle blur = TextStyle(color: Color.fromARGB(80, 0, 0, 0));

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.montserrat(
      fontSize: 82, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.montserrat(
      fontSize: 51, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.montserrat(fontSize: 41, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.montserrat(
      fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 0.25),
  headline5: GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.bold),
  headline6: GoogleFonts.montserrat(
      fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 0.15),
  subtitle1: GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.montserrat(
      fontSize: 12, fontWeight: FontWeight.w300, letterSpacing: 0.1),
  bodyText1: GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.montserrat(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.montserrat(
      fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.montserrat(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.montserrat(
      fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

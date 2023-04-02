/* Arquivo que define algum dos estilos visuais utilizados no aplicativo, como estilos de fonte e cores*/


import 'package:flutter/material.dart';

const kTitleFont = 'Great Vibes';
const kMainFont = 'Roboto';

const kColorRed = Color.fromARGB(255, 226, 9, 13);
const kColorMetal = Color.fromARGB(255, 45, 49, 66);

const kTitleTextStyle = TextStyle(
  fontFamily: kTitleFont,
  fontSize: 48.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  decoration: TextDecoration.none,
);

const kButtonText = TextStyle(
    fontFamily: kMainFont,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    decoration: TextDecoration.none);

const kMainText = TextStyle(
    fontFamily: kMainFont,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: kColorMetal,
    decoration: TextDecoration.none);

const kImageText = TextStyle(
    fontFamily: kMainFont,
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    decoration: TextDecoration.none);
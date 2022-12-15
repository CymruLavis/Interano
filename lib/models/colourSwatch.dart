import 'package:flutter/material.dart';

class Colours {
  Color getPrimarySwatch() {
    //maybe expand this function to have primary and accent colours
    return const Color.fromRGBO(229, 19, 74, 1);
  }

  Color getSecondarSwatch() {
    return const Color.fromRGBO(19, 229, 174, 1);
  }

  Color getAppBarColor() {
    return Color.fromRGBO(229, 19, 74, 1);
  }

  Color getTextButtonColor() {
    return Colors.blue;
  }
}

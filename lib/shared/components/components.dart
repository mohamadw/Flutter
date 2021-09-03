
import 'package:flutter/material.dart';

BottomNavigationBarItem NavigatorBarItem({
  required IconData icon  ,
  required String label,

}) =>
    BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
);
import 'package:animals_app/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Animals App',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: const AnimalsApp()));
}

import 'package:flutter/material.dart';
import 'package:sirius_flutter/widgets/Menu.dart';

void main() {
  runApp(MaterialApp(
    title: 'Sirius',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: Menu(),
  ));
}

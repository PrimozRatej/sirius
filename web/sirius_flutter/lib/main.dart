import 'package:flutter/material.dart';
import 'package:sirius_flutter/widgets/menu.dart';

void main() {
  runApp(MaterialApp(
    title: 'SIrisu',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: Menu(),
  ));
}


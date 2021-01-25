import 'package:flutter/material.dart';
import 'package:sirius_flutter/widgets/Menu.dart';

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

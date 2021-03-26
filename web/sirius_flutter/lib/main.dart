import 'package:flutter/material.dart';
import 'package:sirius_flutter/views/login/LoginController.dart';
import 'package:sirius_flutter/views/main/MainController.dart';
import 'package:sirius_flutter/views/menu/MenuController.dart';

import 'helpers/SharedStorage.dart';
import 'views/main/MainController.dart';

void main() {
  runApp(MaterialApp(
    title: 'Sirius',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: MainController()
  ));
}

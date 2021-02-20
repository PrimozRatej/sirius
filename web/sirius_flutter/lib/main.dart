import 'package:flutter/material.dart';
import 'package:sirius_flutter/views/login/LoginController.dart';
import 'package:sirius_flutter/views/main/Main.dart';

import 'helpers/AppData.dart';

void main() {
  runApp(MaterialApp(
    title: 'Sirius',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: AppData.tokenJWT != null ? Main() : LoginController(),
    //home: Main(),
  ));
}

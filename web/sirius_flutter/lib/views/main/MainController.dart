import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sirius_flutter/helpers/SharedStorage.dart';
import 'package:sirius_flutter/views/login/LoginController.dart';
import 'package:sirius_flutter/views/menu/MenuController.dart';

class MainController extends StatefulWidget {
  createState() => _MenuState();
}

class _MenuState extends State<MainController> {
  Future<String> key;

  initState() {
    SharedStorage storage = new SharedStorage();
    key = SharedStorage.getJWT();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: key,
        builder: (context, snapshot) {
          print("encode");
          print(json.encode(snapshot.data));
          // if (snapshot.hasData) {
          //   return MenuController();
          // }
          // return LoginController();
          return MenuController();
        });
  }
}

import 'package:flutter/material.dart';

class IxScaffoldMessenger implements Exception {
  static void show(BuildContext context, String msg, {MsgType type}) {
    if (type == MsgType.ERROR) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,
        content: Text(msg),
      ));
      throw new Exception(msg);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
      ));
    }
  }
}

enum MsgType {
  ERROR,
  INFO,
}

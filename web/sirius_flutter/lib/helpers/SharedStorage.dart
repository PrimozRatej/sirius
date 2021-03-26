import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Util.dart';

class SharedStorage {
  static String jwtStorageKey = "JWTooken";

  static setJWT(String value) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString(jwtStorageKey, value);
    Util.tokenJWT = value;
    storage.commit();
  }

  static Future<String> getJWT() async {
    final storage = await SharedPreferences.getInstance();
    final value = storage.getString(jwtStorageKey) ?? null;
    Util.tokenJWT = value;
    return value;
  }

  static void deleteJWT() async {
    final storage = await SharedPreferences.getInstance();
    storage.remove(jwtStorageKey);
    Util.tokenJWT = null;
  }
}

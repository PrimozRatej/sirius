import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/AppData.dart';
import 'package:sirius_flutter/helpers/ResponseParser.dart';

class LoginService {
  String pathLogin = "/login";
  String pathSignUp = "/api/domain/user/sign_up";

  Future<String> attemptLogIn(String username, String password) async {
    String url = Assets.domain + pathLogin;
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://localhost:8080/login'));
    request.body =
        '''{\n    "username": "$username",\n    "password": "$password"\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String authJWTokken = ResponseParser.getHeaderValue(
        "authorization", json.encode(response.headers));
    return authJWTokken;
  }

  Future<int> attemptSignUp(
      String username, String password, String email) async {
    String url = Assets.domain + pathSignUp;
    var res = await http.post(url,
        body: {"username": username, "password": password, "email": email});
    return res.statusCode;
  }
}

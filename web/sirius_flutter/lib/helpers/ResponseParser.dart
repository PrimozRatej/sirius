import 'dart:convert';

class ResponseParser {
  static String getHeaderValue(String headerName, String headerJson) {
    Map<String, dynamic> headerKeyValue = jsonDecode(headerJson);
    return headerKeyValue[headerName];
  }
}

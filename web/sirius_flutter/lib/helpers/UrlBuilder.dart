class UrlBuilder {
  static String toUrl(Map<String, dynamic> json) {
    String urlFilterStr = "?";
    for (var val in json.entries) {
      if (val.value != null) {
        urlFilterStr = urlFilterStr +
            val.key.toString() +
            "=" +
            val.value.toString() +
            "&";
      }
    }
    // Remove last '&' from string only if it is character '&'
    // If filter is empty it removes first ? what throws an error at parsing we need to prevent that.
    var lastChar =
        urlFilterStr.substring(urlFilterStr.length - 1, urlFilterStr.length);
    if (lastChar == '&')
      urlFilterStr = urlFilterStr.substring(0, urlFilterStr.length - 1);
    return urlFilterStr;
  }

  static Map<String, dynamic> fromUrl(String url) {
    url = url.substring(1);
    Map<String, dynamic> map = new Map<String, dynamic>();
    for (var val in url.split("&")) {
      map[val.split("=")[0].toString()] = val.split("=")[1].toString();
    }
    return map;
  }

  static String buildUrlForListObj(Map<String, dynamic> json) {
    String urlFilterStr = "";
    for (var val in json.entries) {
      if (val.value != null) {
        urlFilterStr = urlFilterStr +
            val.key.toString() +
            "=" +
            val.value.toString() +
            ", ";
      }
    }
    return urlFilterStr;
  }
}

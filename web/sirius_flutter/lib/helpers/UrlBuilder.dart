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
    String urlFilterStr ="";
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

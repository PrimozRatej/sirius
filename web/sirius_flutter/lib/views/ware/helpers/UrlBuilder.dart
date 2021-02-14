class UrlBuilder {
  static String buildUrl(Map<String, dynamic> json) {
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
    return urlFilterStr;
  }
}

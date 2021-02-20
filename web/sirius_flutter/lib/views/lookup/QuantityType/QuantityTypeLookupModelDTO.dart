class QuantityTypeLookupModelDTO {
  String quantityType;

  QuantityTypeLookupModelDTO({this.quantityType});

  factory QuantityTypeLookupModelDTO.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return QuantityTypeLookupModelDTO(
      quantityType: json["quantityType"],
    );
  }

  static List<QuantityTypeLookupModelDTO> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map((item) => QuantityTypeLookupModelDTO.fromJson(item))
        .toList();
  }

  ///this method will prevent the override of toString
  String quantityTypeAsString() {
    return '${this.quantityType}';
  }

  String empty() {
    return ' ';
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(QuantityTypeLookupModelDTO model) {
    return this?.quantityType == model?.quantityType;
  }

  @override
  String toString() => quantityType;
}

class DashboardDTO {
  int quaToPacked;
  int packToShiped;
  int packToBeDelivered;
  int packToBeInvoice;
  int inHand;
  int toBeReceived;

  DashboardDTO(
      {this.quaToPacked,
      this.packToShiped,
      this.packToBeDelivered,
      this.packToBeInvoice,
      this.inHand,
      this.toBeReceived});

  factory DashboardDTO.fromJson(Map<String, dynamic> json) {
    return DashboardDTO(
      quaToPacked: json['quaToPacked'],
      packToShiped: json['packToShiped'],
      packToBeDelivered: json['packToBeDelivered'],
      inHand: json['inHand'],
      toBeReceived: json['toBeReceived'],
      packToBeInvoice: json['packToBeInvoice'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quaToPacked'] = this.quaToPacked;
    data['packToShiped'] = this.packToShiped;
    data['packToBeDelivered'] = this.packToBeDelivered;
    data['inHand'] = this.inHand;
    data['toBeReceived'] = this.toBeReceived;
    data['packToBeInvoice'] = this.packToBeInvoice;
    return data;
  }

  bool isFilterEmpty() {
    if (quaToPacked == null &&
        packToShiped == null &&
        packToBeDelivered == null &&
        inHand == null &&
        toBeReceived == null &&
        packToBeInvoice == null)
      return true;
    else
      return false;
  }
}

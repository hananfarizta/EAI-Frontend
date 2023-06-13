class PaymentModel {
  List<String>? names;
  String? payment;

  PaymentModel({required this.names, required this.payment});

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      names: List<String>.from(json['names']),
      payment: json['payment'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['names'] = this.names;
    data['payment'] = this.payment;
    return data;
  }
}

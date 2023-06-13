import 'dart:convert';

import 'package:eai_mobile/models/buy_product_model.dart';
import 'package:http/http.dart' as http;

class BuyProductService {
  String baseUrl = 'http://localhost:8080/product';

  Future<PaymentModel> createPayment(
      {List<String>? names, String? payment}) async {
    var url = '$baseUrl/buy';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImhhbmFuQG1haWwuY29tIiwidXNlcm5hbWUiOiJoYW5hbiIsImlhdCI6MTY4NjM1OTcyN30.UEJmaGqYivlb5PhGK7y45xePfCjhASFmcPzAR8KzymI',
    };
    var body = jsonEncode({
      'names': names,
      'payment': payment,
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      PaymentModel paymentModel = PaymentModel.fromJson(data);
      return paymentModel;
    } else {
      throw Exception('Gagal Membeli Product');
    }
  }
}

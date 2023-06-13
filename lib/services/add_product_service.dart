import 'dart:convert';

import 'package:eai_mobile/models/product_model.dart';
import 'package:http/http.dart' as http;

class AddProductService {
  String baseUrl = 'http://localhost:8080/product';

  Future<ShowProduct> create(
      {String? name, String? description, int? price}) async {
    var url = '$baseUrl/create';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImhhbmFuQG1haWwuY29tIiwidXNlcm5hbWUiOiJoYW5hbiIsImlhdCI6MTY4NjM1OTcyN30.UEJmaGqYivlb5PhGK7y45xePfCjhASFmcPzAR8KzymI',
    };
    var body = jsonEncode({
      'name': name,
      'description': description,
      'price': price,
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      ShowProduct products = ShowProduct.fromJson(data);
      // products.token = 'Bearer ' + data['token'];

      return products;
    } else {
      throw Exception('Gagal Menambahkan Product');
    }
  }
}

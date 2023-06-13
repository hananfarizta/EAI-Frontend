import 'package:eai_mobile/models/product_model.dart';
import 'package:eai_mobile/theme.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

class ShowProductPage extends StatefulWidget {
  const ShowProductPage({Key? key}) : super(key: key);

  @override
  State<ShowProductPage> createState() => _ShowProductPageState();
}

class _ShowProductPageState extends State<ShowProductPage> {
  List<ShowProduct> showProduct = [];

  @override
  Widget build(BuildContext context) {
    header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          'All Products',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget content() {
      return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: showProduct.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 110,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: bgColor1,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: primarytextColor,
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Id: ${showProduct[index].sId}',
                        style: TextStyle(fontSize: 18, color: primarytextColor),
                      ),
                      Text(
                        'Name: ${showProduct[index].name}',
                        style: TextStyle(fontSize: 18, color: primarytextColor),
                      ),
                      Text(
                        'Description: ${showProduct[index].description}',
                        style: TextStyle(fontSize: 18, color: primarytextColor),
                      ),
                      Text(
                        'Price: ${showProduct[index].price}',
                        style: TextStyle(fontSize: 18, color: primarytextColor),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(),
      body: content(),
    );
  }

  Future<List<ShowProduct>> getData() async {
    final response = await http.get(
      Uri.parse(
        'http://localhost:8080/product/all-product',
      ),
      headers: {
        // Add your authorization headers here
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImhhbmFuQG1haWwuY29tIiwidXNlcm5hbWUiOiJoYW5hbiIsImlhdCI6MTY4NjM1OTcyN30.UEJmaGqYivlb5PhGK7y45xePfCjhASFmcPzAR8KzymI',
        // Other headers if required
      },
    );

    var data = jsonDecode(response.body.toString());
    print(data);

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        showProduct.add(ShowProduct.fromJson(index));
      }

      return showProduct;
    } else {
      return showProduct;
    }
  }
}

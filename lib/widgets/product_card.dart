import 'package:eai_mobile/models/product_model.dart';
import 'package:eai_mobile/theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // final ProductModel product;
  // ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 85,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: primarytextColor,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Product Name :',
                style:
                    primaryTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Hanans hat',
                style:
                    primaryTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Product Description :',
                style:
                    primaryTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Hanans hat',
                style:
                    primaryTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Product Price :',
                style:
                    primaryTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Hanans hat',
                style:
                    primaryTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

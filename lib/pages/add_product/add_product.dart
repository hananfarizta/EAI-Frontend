import 'package:eai_mobile/providers/add_product_provider.dart';
import 'package:eai_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController nameProductController = TextEditingController(text: '');
  TextEditingController descProductController = TextEditingController(text: '');
  TextEditingController priceProductController =
      TextEditingController(text: '');
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AddProductProvider addProductProvider =
        Provider.of<AddProductProvider>(context);

    handleAddProduct() async {
      setState(() {
        isLoading = true;
      });
      if (await addProductProvider.create(
          name: nameProductController.text,
          description: descProductController.text,
          price: int.parse(priceProductController.text))) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Berhasil Menambahkan Product',
              textAlign: TextAlign.center,
            )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: const Text(
              'Gagal Menambahkan Product',
              textAlign: TextAlign.center,
            )));
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget productNameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Name',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: bgColor2, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: TextFormField(
                  style: primaryTextStyle,
                  controller: nameProductController,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Enter Product Name',
                      hintStyle: subtitleTextStyle),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget productDescInput() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Description',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: bgColor2, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: TextFormField(
                  style: primaryTextStyle,
                  controller: descProductController,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Enter Product Description',
                      hintStyle: subtitleTextStyle),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget productPriceInput() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Price',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: bgColor2, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: TextFormField(
                  style: primaryTextStyle,
                  keyboardType: TextInputType.number,
                  controller: priceProductController,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Enter Product Description',
                      hintStyle: subtitleTextStyle),
                ),
              ),
            ),
          ],
        ),
      );
    }

    header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          'Add Product',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget addProductButton() {
      return Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(top: 50),
        child: TextButton(
          onPressed: handleAddProduct,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: primarytextColor,
                size: 25,
              ),
              Text(
                'Add Product',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor1,
      appBar: header(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productNameInput(),
              productDescInput(),
              productPriceInput(),
              addProductButton(),
            ],
          ),
        ),
      ),
    );
  }
}

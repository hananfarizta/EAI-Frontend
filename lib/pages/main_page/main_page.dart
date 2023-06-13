import 'package:eai_mobile/pages/add_product/add_product.dart';
import 'package:eai_mobile/pages/payment_page/payment_page.dart';
import 'package:eai_mobile/pages/show_product/show_product.dart';
import 'package:eai_mobile/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget bottomNavbar() {
      return BottomNavigationBar(
        backgroundColor: bgColor2,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Icon(
                        Icons.add,
                        color: primaryColor,
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Icon(
                        Icons.add,
                        color: primarytextColor,
                      ),
                    ),
              label: ''),
          BottomNavigationBarItem(
              icon: currentIndex == 1
                  ? Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Icon(
                        Icons.show_chart,
                        color: primaryColor,
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Icon(
                        Icons.show_chart,
                        color: primarytextColor,
                      ),
                    ),
              label: ''),
          BottomNavigationBarItem(
              icon: currentIndex == 2
                  ? Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Icon(
                        Icons.payment_outlined,
                        color: primaryColor,
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Icon(
                        Icons.payment_outlined,
                        color: primarytextColor,
                      ),
                    ),
              label: ''),
        ],
      );
    }

    body() {
      switch (currentIndex) {
        case 0:
          return const AddProductPage();
        case 1:
          return const ShowProductPage();
        case 2:
          return const PaymentPage();
        default:
          return body();
      }
    }

    return Scaffold(
      backgroundColor: bgColor1,
      bottomNavigationBar: bottomNavbar(),
      body: body(),
    );
  }
}

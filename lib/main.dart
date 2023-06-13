import 'package:eai_mobile/pages/main_page/main_page.dart';
import 'package:eai_mobile/pages/payment_page/payment_page.dart';
import 'package:eai_mobile/pages/show_product/show_product.dart';
import 'package:eai_mobile/pages/add_product/add_product.dart';
import 'package:eai_mobile/pages/sign_in_page/sign_in_page.dart';
import 'package:eai_mobile/pages/sign_up_page/sign_up_page.dart';
import 'package:eai_mobile/providers/add_product_provider.dart';
import 'package:eai_mobile/providers/auth_provider.dart';
import 'package:eai_mobile/providers/buy_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => AddProductProvider()),
        ChangeNotifierProvider(create: (context) => BuyProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/main': (context) => const MainPage(),
          '/addproduct': (context) => const AddProductPage(),
          '/showproduct': (context) => const ShowProductPage(),
          '/payment': (context) => const PaymentPage(),
        },
      ),
    );
  }
}

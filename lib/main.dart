import 'package:flutter/material.dart';
import 'screen/MyCart.dart';
import 'screen/MyCatalog.dart';
import 'package:provider/provider.dart';
import 'provider/shoppingcart_provider.dart';
import 'screen/Checkout.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoppingCart()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyCatalog(),
        '/cart': (context) => const MyCart(),
        '/checkout': (context) => const Checkout(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const MyCatalog());
      },
    );
  }
}

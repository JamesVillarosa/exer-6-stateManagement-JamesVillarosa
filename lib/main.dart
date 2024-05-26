import 'package:flutter/material.dart';
import 'screen/MyCart.dart';
import 'screen/MyCatalog.dart';
import 'package:provider/provider.dart';                    // Importing packages, screens, and provider that we need
import 'provider/shoppingcart_provider.dart';
import 'screen/Checkout.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoppingCart()),      // Provide the ShoppingCart provider to the app
      ],
      child: const MyApp(),                                               // Run the MyApp widget as the root of the application
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
      initialRoute: '/',                                                      // Set the initial route of the app to the catalog screen
      routes: {
        '/': (context) => const MyCatalog(),
        '/cart': (context) => const MyCart(),                                 // Routes on different screens
        '/checkout': (context) => const Checkout(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const MyCatalog());   // Handle unknown routes by navigating to the catalog screen
      },
    );
  }
}

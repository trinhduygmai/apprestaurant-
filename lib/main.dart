import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home/cuisine_screen.dart';
import 'screens/menu/menu_items_screen.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/success/success_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => LoginScreen(),
        '/signup': (ctx) => SignupScreen(),
        '/cuisine': (ctx) => CuisineScreen(),
        '/menu_items': (ctx) => MenuItemsScreen(),
        '/cart': (ctx) => CartScreen(),
        '/success': (ctx) => SuccessScreen(),
      },
    );
  }
}

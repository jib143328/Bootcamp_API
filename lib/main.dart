import 'package:dio_api/core/views/screens/Todos/todos_screen.dart';
import 'package:dio_api/core/views/screens/products/login_screen.dart';
import 'package:dio_api/core/views/screens/products/products_screen.dart';
import 'package:dio_api/core/views/screens/products/responsive_products_screen.dart';
import 'package:dio_api/helpers/app_routes.dart';
// import 'package:dio_api/core/views/screens/todos_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   // home:LoginScreen() ,
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      onGenerateRoute: AppRoutes.routeManager,

    );
  }
}

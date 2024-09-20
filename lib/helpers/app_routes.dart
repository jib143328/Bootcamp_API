import 'package:dio_api/core/views/screens/not_found_screen.dart';
import 'package:dio_api/core/views/screens/products/login_screen.dart';
import 'package:dio_api/core/views/screens/products/products_screen.dart';
import 'package:dio_api/core/views/screens/products/responsive_products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes{

    static Route<dynamic>? routeManager(RouteSettings settings){
      switch(settings.name){
        case '/products': return MaterialPageRoute(builder: (ctx)=>ResponsiveProductsScreen());
        case '/login': return MaterialPageRoute(builder: (ctx)=>LoginScreen());

        default : return MaterialPageRoute(builder: (ctx)=>NotFoundScreen());
      }

     }
}
import 'package:dio_api/core/view_models/products_vm.dart';
import 'package:dio_api/core/views/screens/products/products_screen.dart';
import 'package:dio_api/core/views/screens/products/products_tablet_screen.dart';
import 'package:flutter/material.dart';

class ResponsiveProductsScreen extends StatefulWidget {

   ResponsiveProductsScreen({super.key});


  @override
  State<ResponsiveProductsScreen> createState() => _ResponsiveProductsScreenState();
}

class _ResponsiveProductsScreenState extends State<ResponsiveProductsScreen> {
  ProductsVm productsVm = ProductsVm();
  int tabletSize=768;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: productsVm.getProducts(),
        builder:(ctx,snapshot){
          if(snapshot.connectionState==ConnectionState.done)
            return LayoutBuilder(
                builder: (ctx,constraint){
              if(constraint.maxWidth<tabletSize)
                return ProductsScreen(products: snapshot.data!,);
                return ProductsTabletScreen(products: snapshot.data!);
            }
            );
          else return Center(child: CircularProgressIndicator());
        }
        );
  }
}

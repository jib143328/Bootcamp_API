import 'package:dio_api/core/view_models/products_vm.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsVm prodVM= ProductsVm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
          future:prodVM.getProducts() ,
          builder: (ctx,snapshot){
            return Center(child: CircularProgressIndicator(strokeAlign: 3,backgroundColor: Colors.deepOrangeAccent,));
          }
      ) ,

    );
  }
}

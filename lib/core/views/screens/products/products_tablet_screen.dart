import 'package:dio_api/core/models/product.dart';
import 'package:flutter/material.dart';

class ProductsTabletScreen extends StatefulWidget {
  List<Products?> products;
   ProductsTabletScreen({super.key,required this.products});

  @override
  State<ProductsTabletScreen> createState() => _ProductsTabletScreenState();
}

class _ProductsTabletScreenState extends State<ProductsTabletScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(

      body: ListView.builder(
          itemCount: widget.products.length,
          itemBuilder: (ctx,index){
            return Container(
              child: Row(
                children: [
                  Expanded(flex: 1,child: Image.network(widget.products[index]!.image!),
                  ),
                  Expanded(flex: 3,
                    child: ListTile(title: Text(widget.products[index]!.title!),
                      leading: CircleAvatar(child: Center(child: Text("${widget.products[index]!.price}"),),),
                    ),
                  ),
                ],
              ),
            );
          }
           ),
     );
  }
}

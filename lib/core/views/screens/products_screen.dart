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
            if(snapshot.connectionState==ConnectionState.done){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (ctx,index){
                  return Container(
                   child: Column(
                     children: [
                       Image.network(snapshot.data![index].image!),
                       ListTile(title: Text(snapshot.data![index].title!),
                         leading: CircleAvatar(child: Center(child: Text("${snapshot.data![index].price}"),),),
                       ),
                     ],
                   ), 
                  );
              }
              );
            }

            return Center(child: CircularProgressIndicator(strokeAlign: 3,backgroundColor: Colors.deepOrangeAccent,));
          }
      ) ,

    );
  }
}

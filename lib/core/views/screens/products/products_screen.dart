import 'package:dio_api/core/models/product.dart';
import 'package:dio_api/core/view_models/products_vm.dart';
import 'package:dio_api/core/views/screens/products/login_screen.dart';
import 'package:dio_api/core/views/widgets/app_drawer.dart';
import 'package:dio_api/core/views/widgets/button_rounded_container.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
   ProductsScreen({super.key, required this.products});
  List<Products?> products;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsVm prodVM= ProductsVm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),

      body:
               ListView.builder(
                itemCount: widget.products.length,
                  itemBuilder: (ctx,index){
                  return Container(
                   child: Column(
                     children: [
                       Image.network(widget.products[index]!.image!),
                       ListTile(title: Text(widget.products[index]!.title!),
                         leading: CircleAvatar(child: Center(child: Text("${widget.products[index]!.price}"),),),
                       ),
                     ],
                   ),
                  );
              }
              ),


    );
  }
}
//=====bodyold
// body: FutureBuilder(
// future:prodVM.getProducts() ,
// builder: (ctx,snapshot){
// if(snapshot.connectionState==ConnectionState.done){
// return ListView.builder(
// itemCount: snapshot.data!.length,
// itemBuilder: (ctx,index){
// return Container(
// child: Column(
// children: [
// Image.network(snapshot.data![index].image!),
// ListTile(title: Text(snapshot.data![index].title!),
// leading: CircleAvatar(child: Center(child: Text("${snapshot.data![index].price}"),),),
// ),
// ],
// ),
// );
// }
// );
// }
// else
// return Center(child: CircularProgressIndicator(strokeAlign: 3,backgroundColor: Colors.deepOrangeAccent,));
// }
// ) ,
import 'package:dio/dio.dart';
import 'package:dio_api/core/models/product.dart';

class ProductsVm{

 Future<List<Products>?> getProducts() async {
    Dio dio=Dio();
   try {
     Response<List<Map<String,dynamic>>> res = await dio.get("https://fakestoreapi.com/products") as Response<List<Map<String,dynamic>>>;
     List<Products>? allProducts=res.data?.map((e)=>Products.fromJson(e)).toList();
     return allProducts;
   }
       catch(exciption){
          print("The exciption is $exciption");
       }
    
   }
  }

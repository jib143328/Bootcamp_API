import 'package:dio/dio.dart';

class HttpHelper{

  HttpHelper._();
  static HttpHelper? httphelper;

 static HttpHelper get instance {
   if (httphelper == null)
     httphelper = HttpHelper._();
   return httphelper!;
 }
   Dio dio =Dio();

   Future<Response> getRequest({required String url}) async {
    return await dio.get(url);
   }

  Future<Response> postRequest({required String url,required dynamic data,Options? options}) async {
     return await dio.post(url,data:data,options: options );

   }

}

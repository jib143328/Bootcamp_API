import 'package:dio/dio.dart';
import 'package:dio_api/core/constants/http_urls.dart';
import 'package:dio_api/core/models/user.dart';
import 'package:dio_api/helpers/http_helper.dart';
import 'package:dio_api/helpers/storage_helper.dart';

class UsersVm{

  Future<User?> login(User u) async {
    try {
      HttpHelper http = HttpHelper.instance;
      Response res = await http.postRequest(
          url: HttpUrls.LOGIN_URL, data: u.authData());
      if(res.statusCode==200)
        {
          print("====${res.data}");
          User user=User.fromJson(res.data);
          saveInStorage(user);
          print("FIRRRRRRRsT");
          print("FIRST NAME${user.firstName}");
          return user;
        }
      return null;
    }
    catch(ex){
      print("THE ExCEPTION is $ex");
    }
  }

  saveInStorage(User user){
    StorageHelper storageHelper=StorageHelper.instance;
    storageHelper.writeKey("f_name", user.firstName);
    storageHelper.writeKey("l_name", user.lastName);
    storageHelper.writeKey("email", user.email);
    storageHelper.writeKey("image", user.image);
    storageHelper.writeKey("user_name", user.username);
    storageHelper.writeKey("token", user.token);

  }

}
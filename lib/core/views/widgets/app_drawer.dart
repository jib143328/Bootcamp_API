import 'package:dio_api/core/view_models/users_vm.dart';
import 'package:dio_api/helpers/storage_helper.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
   AppDrawer({super.key});
  StorageHelper storageHelper=StorageHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(accountName: Text("${storageHelper.readKey("f_name")==null?"name":storageHelper.readKey("f_name")} ${storageHelper.readKey("l_name")==null?"lastname":storageHelper.readKey("l_name")}"),
            accountEmail: Text(storageHelper.readKey("email")==null?"email":storageHelper.readKey("email")),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(storageHelper.readKey("image")==null?"":storageHelper.readKey("image")),
            ),),
          ListTile(onTap: (){
            storageHelper.eraseStorage();
            Navigator.pushNamed(context, "/login");
          },
          title: Text("Log Out"),
          ),
          ListTile(onTap: (){
            if(storageHelper.readKey("token")!=null)
            Navigator.pushNamed(context, "/products");
            //Navigator.pushNamed(context, "/products");
          },
            title: Text("Products"),
          ),
          ListTile(onTap: (){
            Navigator.pushNamed(context, "/login");
          },
            title: Text("Login"),
          )

        ],
      ),

    );
  }
}

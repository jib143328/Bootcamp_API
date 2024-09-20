import 'package:dio/dio.dart';
import 'package:dio_api/core/models/user.dart';
import 'package:dio_api/core/view_models/users_vm.dart';
import 'package:dio_api/core/views/screens/products/responsive_products_screen.dart';
import 'package:dio_api/core/views/widgets/app_text_form.dart';
import 'package:dio_api/core/views/widgets/button_rounded_container.dart';
import 'package:dio_api/core/views/widgets/rounded_container.dart';
import 'package:dio_api/core/views/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_drawer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  UsersVm uservm=UsersVm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Login Screen"),
              ),
      drawer: AppDrawer(),
      body:  Column(mainAxisAlignment: MainAxisAlignment.center
          ,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          RoundedContainer(
          margin: EdgeInsets.symmetric(horizontal: 20),
        radius: 20,
        child: AppTextForm(
          controller:usernameController ,
          hint: "userName",
          label: "Enter your username...",
        )),
    VerticalSpace(),
    RoundedContainer(
    margin: EdgeInsets.symmetric(horizontal: 20),
    radius: 20,
    child: AppTextForm(
    controller: passwordController,
    hint: "password",
    label: "Enter your password...",
    )),
    VerticalSpace(),
            ButtonRoundedContainer(
                margin: EdgeInsets.all(20),
                width: 100,height: 50,
                color: Colors.cyan,
                onTap: ()async{
                  User user =User(username: usernameController.text,password: passwordController.text);
                  uservm.login(user).then((x){
                    Navigator.pop(context);
                    if(x!=null)
                      Navigator.pushReplacementNamed(context, "/products");
                     // Navigator.push(context, new MaterialPageRoute(builder: (context) =>new ResponsiveProductsScreen()));

                    else
                      Dialog(child: AlertDialog(
                        content:Text("NOT a correct login") ,),);
                  });

                 showModalBottomSheet(context: context, builder: (ctx)=>Container(height: 300,
                 child: Center(child:
                   CircularProgressIndicator(),),));

            }, text: "Login"),


    ],
      ),
    );
  }
}

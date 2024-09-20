import 'package:flutter/material.dart';

class AppTextForm extends StatelessWidget {
  AppTextForm({Key? key,this.controller, this.hint,this.label}) : super(key: key);
  String? label,hint;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          label: label!=null?Text(label!):null,

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)
      ),
    );
  }
}

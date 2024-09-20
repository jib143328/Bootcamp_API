import 'package:flutter/material.dart';

class ButtonRoundedContainer extends StatelessWidget {
  ButtonRoundedContainer({Key? key,
    this.height,this.width,
    this.color,this.margin,
    this.textStyle,
    this.radius,
    required this.onTap,required this.text}) : super(key: key);
  VoidCallback onTap;
  String text;
  double? width,height;
  Color?color;
  double? radius;
  EdgeInsetsGeometry? margin,padding;
  TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius??10),
                color: color??Colors.grey[200]
            ),
            height: height,
            width: width,
            margin: margin,
            padding: padding,
            child: Center(child: Text(text,style:textStyle??TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),));
  }
}

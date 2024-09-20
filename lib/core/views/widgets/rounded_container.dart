import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  RoundedContainer({Key? key,required this.child,this.radius,this.color,this.margin}) : super(key: key);
  double? radius;
  Color? color;
  late Widget child;
  EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin??EdgeInsets.all(10),
      child: child,
      decoration: BoxDecoration(
          color: color??Colors.grey[200],
          borderRadius: BorderRadius.circular(radius??5)
      ),
    );
  }
}

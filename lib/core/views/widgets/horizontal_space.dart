import 'package:flutter/cupertino.dart';

class HorizontalSpace extends StatelessWidget {
  HorizontalSpace({Key? key,this.space}) : super(key: key);
  double? space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width:space??10 ,);
  }
}

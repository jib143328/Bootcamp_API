import 'package:flutter/cupertino.dart';

class VerticalSpace extends StatelessWidget {
  VerticalSpace({Key? key,this.space}) : super(key: key);
  double? space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space??10,);
  }
}

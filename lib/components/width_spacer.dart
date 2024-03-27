import 'package:flutter/material.dart';

class WSpacer extends StatelessWidget {
  double width;
  WSpacer({super.key,required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

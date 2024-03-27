import 'package:flutter/material.dart';

class HSpacer extends StatelessWidget {
  double height;
  HSpacer({super.key,required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

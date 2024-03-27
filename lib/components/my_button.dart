import 'package:flutter/material.dart';
import 'package:subhapradha_holdings_assessment/constants/my_colors.dart';
import 'package:subhapradha_holdings_assessment/constants/styles.dart';

class MyButton extends StatelessWidget {
  String btnText;
  void Function()? onTap;

  MyButton({required this.btnText, super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          width: w,
          height: h / 15,
          decoration: BoxDecoration(
            gradient: MyColors.buttonColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              btnText,
              style: Styles.btnTextStyle
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'height_spacer.dart';

class BottomItem extends StatelessWidget {
  IconData icon;
  String iconText;
  BottomItem({super.key,required this.icon,required this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue.shade700,
          ),
          child: Icon(
            // Icons.folder_outlined,
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
        HSpacer(height: 5),
        Text(iconText),
      ],
    );
  }
}

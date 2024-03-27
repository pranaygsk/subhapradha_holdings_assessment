import 'package:flutter/material.dart';
import 'package:subhapradha_holdings_assessment/components/width_spacer.dart';

class ListItem extends StatelessWidget {
  Color iconColor;
  String itemText;

  ListItem({required this.iconColor,required this.itemText,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(color: Colors.blue.shade50,borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Icon(Icons.video_file_outlined,color: iconColor),
              WSpacer(width: 5),
              Text(itemText),
            ],
          ),
          const Icon(Icons.close)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:subhapradha_holdings_assessment/components/width_spacer.dart';

class RecentListItem extends StatelessWidget {
  String title;
  String subTitle;
  Color statusColor;
  String statusText;
  Color containerColor;
  IconData iconData;

  RecentListItem({
    required this.title,
    required this.subTitle,
    required this.statusColor,
    required this.statusText,
    required this.containerColor,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  softWrap: true,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              WSpacer(width: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: containerColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      iconData,
                      color: statusColor,
                      size: 14,
                    ),
                    WSpacer(width: 5.0),
                    Text(
                      statusText,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            subTitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subhapradha_holdings_assessment/components/width_spacer.dart';

import 'height_spacer.dart';

class ErrorMessage extends StatelessWidget {
  bool visible;
  String errorText;
  ErrorMessage({required this.errorText,required this.visible,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.cancel,
              color: Colors.red,
              size: 16,
            ),
            Text(
              errorText,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
            WSpacer(width: 10),
            Visibility(
              visible: visible,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Translate',
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
              ),
            )
          ],
        ),
        HSpacer(height: 15),
      ],
    );
  }
}

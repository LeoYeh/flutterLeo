
import 'package:flutter/material.dart';

import 'package:bmi_caculator/constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;

  RoundIconButton({required this.iconData, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        iconData,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      onPressed: () {
        onPressed();
      },
      elevation: 6,
      shape: CircleBorder(),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Color(0xFF3C3F5E),
    );
  }
}

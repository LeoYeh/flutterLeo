
import 'package:flutter/material.dart';

import 'package:bmi_caculator/constants.dart';

class BottomButton extends StatelessWidget {
  final String btnText;
  final Function onTap;

  BottomButton({
    required this.btnText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBottomContainerColour,
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: kBottomContainerHeight,
      child: TextButton(
          onPressed: () {
            onTap();
          },
          child: Text(
            btnText,
            style: kBodyTextStyle.copyWith(
              color: Colors.white,
            ),
          )),
    );
  }
}
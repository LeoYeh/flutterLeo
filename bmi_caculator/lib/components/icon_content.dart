import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8d8e98),
);

class IconContent extends StatelessWidget {
  final IconData iconData;
  final String label;

  IconContent({
    required this.iconData,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(height: 15),
        Text(label, style: labelTextStyle),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:greengrocer/src/config/custom_colors.dart';

class AppNameWidget extends StatelessWidget {
  final double fontSize;
  final Color greenTitleColor;

  const AppNameWidget({
    Key? key,
    this.fontSize = 30,
    this.greenTitleColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: fontSize,
        ),
        children: [
          TextSpan(
            text: 'Green',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: greenTitleColor,
            ),
          ),
          TextSpan(
            text: 'grocer',
            style: TextStyle(
              color: CustomColors.customContrastColor,
            ),
          ),
        ],
      ),
    );
  }
}

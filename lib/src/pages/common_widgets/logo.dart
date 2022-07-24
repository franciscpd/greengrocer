import 'package:flutter/material.dart';

import 'package:greengrocer/src/config/custom_colors.dart';

class Logo extends StatelessWidget {
  final double fontSize;
  final Color primaryColor;

  const Logo({
    Key? key,
    required this.fontSize,
    this.primaryColor = Colors.white,
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
              color: primaryColor,
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

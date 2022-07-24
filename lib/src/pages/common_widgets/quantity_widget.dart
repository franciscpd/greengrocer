import 'package:flutter/material.dart';

import 'package:greengrocer/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String sufixText;
  final Function(int quantity) result;
  final bool isRemovable;

  const QuantityWidget({
    Key? key,
    required this.sufixText,
    required this.value,
    required this.result,
    this.isRemovable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            icon:
                isRemovable && value <= 1 ? Icons.delete_forever : Icons.remove,
            color: isRemovable && value <= 1 ? Colors.red : Colors.grey,
            onPressed: () {
              if (value == 1 && !isRemovable) return;

              result(value - 1);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: Text(
              '$value$sufixText',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _QuantityButton(
            icon: Icons.add,
            color: CustomColors.customSwatchColor,
            onPressed: () {
              result(value + 1);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String? text;

  const CustomDivider({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey.withAlpha(90),
              thickness: 2,
            ),
          ),
          text != null
              ? const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Text('ou'),
                )
              : const SizedBox(),
          Expanded(
            child: Divider(
              color: Colors.grey.withAlpha(90),
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}

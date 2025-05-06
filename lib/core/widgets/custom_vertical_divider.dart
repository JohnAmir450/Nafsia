import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 30,
        child: VerticalDivider(
          width: 20,
          thickness: 2,
          color: Colors.grey,
        ));
  }
}

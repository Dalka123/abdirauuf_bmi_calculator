import 'package:flutter/material.dart';

class IconTitle extends StatelessWidget {
  final IconData iconData;
  final String title;
  IconTitle({required this.iconData, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 100,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '$title',
          style: TextStyle(color: Colors.grey, fontSize: 30),
        )
      ],
    );
  }
}

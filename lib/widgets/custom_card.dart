import 'package:bmi_calculator/widgets/constants.dart';
import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  final Widget? child;
  final Function()? onPressed;
  final bool selected;
  CustomCard({required this.child, this.onPressed, this.selected = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color : selected == true ? kActiveCardColour : kInactiveCardColour,
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
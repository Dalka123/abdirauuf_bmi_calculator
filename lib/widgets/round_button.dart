import 'package:bmi_calculator/widgets/constants.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData iconData;
  RoundButton({required this.iconData, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        iconData,
        size: 40,
      ),
      fillColor: kBottomContainerColour,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
    );
  }
}

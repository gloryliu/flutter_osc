import 'package:flutter/material.dart';

class FlagText extends StatelessWidget {
  final Color backGroundColor;
  final Color textColor;
  final double textSize;
  final String text;

  const FlagText(this.text,
      {this.textColor = Colors.white,
      this.textSize = 12,
      this.backGroundColor = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 18,
      height: 18,
      decoration: BoxDecoration(
          color: backGroundColor, borderRadius: BorderRadius.circular(2)),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: textSize),
      ),
    );
  }
}

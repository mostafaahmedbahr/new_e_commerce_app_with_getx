import 'package:flutter/material.dart';
  class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration underLine;
  const TextUtils({required this.text,
    required this.underLine,
    required this.fontSize,
    required this.fontWeight,
    required this.color,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text,
        style: TextStyle(
          decoration: underLine,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color:color,
          ),

        ),
    );
  }
}

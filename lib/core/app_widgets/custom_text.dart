import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  double? size;
  int? maxLines;
  FontWeight? weight;
  Color? color;
  TextDecoration? decoration;
  CustomText(
      {required this.text,
      this.color = Colors.black,
      this.weight,
      this.maxLines = 1,
      this.decoration = TextDecoration.none,
      this.size,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          decoration: decoration,
          fontSize: size,
          fontWeight: weight,
          color: color),
    );
  }
}

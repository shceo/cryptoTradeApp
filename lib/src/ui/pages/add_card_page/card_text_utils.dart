import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextUtil extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  bool? weight;

  TextUtil({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? Colors.white,
          fontSize: size ?? 18,
          fontFamily: "ubuntu",
          fontWeight: weight == null ? FontWeight.normal : FontWeight.w900),
    );
  }
}

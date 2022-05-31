import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.txt, this.size, this.weight})
      : super(key: key);
  final String txt;
  final double? size;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(color: Colors.grey, fontWeight: weight, fontSize: size),
    );
  }
}

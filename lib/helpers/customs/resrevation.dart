import 'package:flutter/material.dart';
import 'package:task_inovola/helpers/styles/custom_texts.dart';

class CustomReservation extends StatelessWidget {
  const CustomReservation({Key? key, this.title, this.price}) : super(key: key);
  final String? title;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          txt: title!,
          size: 20,
        ),
        CustomText(
          txt: price!,
          size: 20,
        ),
      ],
    );
  }
}

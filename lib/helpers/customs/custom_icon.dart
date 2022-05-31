import 'package:flutter/material.dart';

class IconItem extends StatelessWidget {
  const IconItem({Key? key, this.onPressed, this.icon}) : super(key: key);
  final void Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
        ));
  }
}

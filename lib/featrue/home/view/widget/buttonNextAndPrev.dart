import 'package:flutter/material.dart';

class buttonNextAndPrev extends StatelessWidget {
  const buttonNextAndPrev({
    super.key,
    required this.data,
    this.onPressed,
  });
  final String data;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: onPressed,
        child: Text(
          data,
          style: TextStyle(fontSize: 21),
        ));
  }
}

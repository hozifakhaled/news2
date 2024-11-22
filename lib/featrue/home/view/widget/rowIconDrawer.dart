import 'package:flutter/material.dart';

class rowIconDrawer extends StatelessWidget {
  const rowIconDrawer({
    super.key,
    required this.icon,
    required this.text,
  });
  final Icon icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 50, child: icon),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

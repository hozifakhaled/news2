import 'package:flutter/material.dart';
import 'package:news/constants.dart';

class ContainerTypeNews extends StatelessWidget {
  const ContainerTypeNews({
    super.key,
    this.onTap,
    required this.text,
    required this.size,
  });
  final void Function()? onTap;
  final String text;
  final double size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: gettheme(context).cardColor,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(fontSize: size),
          ),
        ),
      ),
    );
  }
}

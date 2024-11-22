import 'package:flutter/material.dart';

class ArticleSection extends StatelessWidget {
  final String title;
  final String content;

  const ArticleSection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
           
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      const  SizedBox(height: 10),
        Text(content, style: const TextStyle(fontSize: 15)),
      ],
    );
  }
}
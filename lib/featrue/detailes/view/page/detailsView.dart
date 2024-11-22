import 'package:flutter/material.dart';
import 'package:news/featrue/detailes/view/widget/DetailsViewBody.dart';
import 'package:news/featrue/home/model/models/ArticlesModel.dart';

class DetailsView extends StatelessWidget {
  final ArticleModel article;

  const DetailsView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: DetailsViewBody(article: article,), // No need to pass providers here
    );
  }
}
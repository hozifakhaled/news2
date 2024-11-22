import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/helper/helpers.dart';
import 'package:news/featrue/detailes/controller/cubit/details_cubit_cubit.dart';
import 'package:news/featrue/detailes/model/ArticalesModel.dart';
import 'package:news/featrue/detailes/view/widget/iconDeatiles.dart';
import 'package:news/featrue/detailes/view/widget/imageDeatiles.dart';
import 'package:news/featrue/detailes/view/widget/textDetailes.dart';
import 'package:news/featrue/home/model/models/ArticlesModel.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsViewBody extends StatelessWidget {
  final ArticleModel article;
  const DetailsViewBody({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubitCubit(),
      child: BlocBuilder<DetailsCubitCubit, DetailsCubitState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(article.author ?? 'Article Details'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.title ?? 'No title',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Stack(children: [
                      ArticleImage(
                        imageUrl: article.urlToImage ?? '',
                      ),
                      Positioned(
                        bottom: 5,
                        right: 10,
                        child: Row(
                          children: [
                            CustomIconButton(
                              icon: Icons.bookmark,
                              onPressed: () {
                                ArticalesModel articalesModel = ArticalesModel(
                                    title: article.title.toString(),
                                    image: article.urlToImage.toString(),
                                    url: article.url.toString());
                                context
                                    .read<DetailsCubitCubit>()
                                    .addArtical(articalesModel);
                                Helpers().snackBar(context);
                              },
                            ),
                            const SizedBox(width: 10),
                            CustomIconButton(
                              icon: Icons.share,
                              onPressed: () async {
                                Helpers().urlLauncherLink(article.url ?? '');
                              }, // Implement share functionality
                            ),
                          ],
                        ),
                      ),
                    ]),
                    const SizedBox(height: 22),
                    ArticleSection(
                      title: 'Description',
                      content: article.description ?? 'No description',
                    ),
                    const SizedBox(height: 9),
                    ArticleSection(
                      title: 'Content',
                      content: article.content ?? 'No content',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

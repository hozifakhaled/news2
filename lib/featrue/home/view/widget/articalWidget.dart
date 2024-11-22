import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/constants.dart';
import 'package:news/featrue/home/model/models/ArticlesModel.dart';
import 'package:news/featrue/home/view/widget/titleText.dart';

class Articalwidget extends StatelessWidget {
  const Articalwidget({super.key, required this.articlesModel});
  final ArticleModel articlesModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned(
            child: containerRaid(),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: containerRaid(),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(8),
            color: gettheme(context).cardColor,
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 4 / 4,
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl:
                        articlesModel.urlToImage ?? 'https://rickandmortyapi.com/api/character/avatar/1.jpeg' ,
                        errorWidget: (context, url, error) => Image.asset('assets/images/empty_image.png'),
                      ),
                    )),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                        width: 200,
                        child: TitlesTextWidget(
                          label: articlesModel.title ??"no title",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 200,
                        child: TitlesTextWidget(
                          label: '🕒 Rocording time',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                          textAlign: TextAlign.end,
                        )),
                    Container(
                        width: 200,
                        child: TitlesTextWidget(
                          label: '🔗 20-26-52-30-20-00-0',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                          textAlign: TextAlign.end,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class containerRaid extends StatelessWidget {
  const containerRaid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      color: Colors.grey,
    );
    ;
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/constants.dart';

import '../../featrue/home/view/widget/titleText.dart';

class ContainerItem extends StatelessWidget {
  const ContainerItem({
    super.key,
     required this.text, required this.imageurl,
  });

  
  final String text;
  final String imageurl ;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  imageUrl:imageurl,
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/empty_image.png'),
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
                    label: text,
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
    );
  }
}

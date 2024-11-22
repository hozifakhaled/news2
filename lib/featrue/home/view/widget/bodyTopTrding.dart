import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/constants.dart';
import 'package:news/core/getit/serviceLecator.dart';
import 'package:news/featrue/home/controller/cubit/artical_cubit.dart';
import 'package:news/featrue/home/model/repo/characterepo.dart';
import 'package:news/featrue/home/view/widget/titleText.dart';
import 'package:shimmer/shimmer.dart';

class Bodytoptrding extends StatelessWidget {
  const Bodytoptrding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ArticalCubit(getIt.get<Articlesrepo>())..getAllCharacters(),
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Swiper(
                itemCount: 8,
                viewportFraction: .9,
                itemHeight: MediaQuery.of(context).size.height * 0.5,
                itemWidth: MediaQuery.of(context).size.width * .8,
                autoplay: true,
                autoplayDelay: 8000,
                layout: SwiperLayout.STACK,
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    //padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: gettheme(context).cardColor,
                    ),
                    margin: EdgeInsets.all(8),

                    child: BlocBuilder<ArticalCubit, ArticalState>(
                      builder: (context, state) {
                        if (state is Articlesloaded) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * .39,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl: state
                                              .articles[index].urlToImage ??
                                          'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                              'assets/images/empty_image.png'),
                                    )),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TitlesTextWidget(
                                  label:
                                      state.articles[index].title ?? "no title",
                                  maxLines: 1,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 23,
                                  textAlign: TextAlign.left,
                                ),
                              )
                            ],
                          );
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                  baseColor: Colors.black,
                    highlightColor: Colors.grey,
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * .39,
                                
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:Shimmer.fromColors (
                                  baseColor: Colors.grey,
                    highlightColor: Colors.white,
                                  child: Container(
                                    width: 100,
                                    height: 10,
                                  ))
                              )
                            ],
                          );
                        }
                      },
                    ),
                  );
                })));
  }
}


/**
 * 
 */
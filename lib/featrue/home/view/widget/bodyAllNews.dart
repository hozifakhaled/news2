import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/getit/serviceLecator.dart';
import 'package:news/featrue/detailes/view/page/detailsView.dart';
import 'package:news/featrue/home/controller/cubit/artical_cubit.dart';
import 'package:news/featrue/home/model/repo/characterepo.dart';
import 'package:news/featrue/home/view/widget/articalWidget.dart';
import 'package:news/featrue/home/view/widget/dropdownButtonyTypeNews.dart';
import 'package:news/featrue/home/view/widget/rowNumberButton.dart';
import 'package:shimmer/shimmer.dart';

class BodyAllNews extends StatelessWidget {
  const BodyAllNews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ArticalCubit(getIt.get<Articlesrepo>())..getAllCharacters(),
      child: Column(
        children: [
          Rownumberbutton(),
          Dropdownbuttonytypenews(),
          BlocBuilder<ArticalCubit, ArticalState>(
            builder: (context, state) {
              if (state is Articlesloaded) {
                return SizedBox(
                  height: 584.2,
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsView(
                                        article: state.articles[index])));
                          },
                          child: Articalwidget(
                            articlesModel: state.articles[index],
                          ));
                    },
                  ),
                );
              } else if (state is Articalsfailure) {
                return Image.asset('assets/images/no_news.png');
              } else {
                return SizedBox(
                    height: 584.2,
                    
                    child: ListView.builder(
                        
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Shimmer.fromColors(
                                baseColor: Colors.grey,
                                highlightColor: Colors.white,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.grey,
                                  ),
                                  margin: EdgeInsets.only(right: 15),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      child: AspectRatio(
                                        aspectRatio: 4 / 1,
                                      ),
                                    ),
                                  ),
                                )),
                          );
                        }));
              }
            },
          ),
        ],
      ),
    );
    ;
  }
}

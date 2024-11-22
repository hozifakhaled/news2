import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/getit/serviceLecator.dart';
import 'package:news/core/widget/shimmerlistviewAllnews.dart';

import 'package:news/featrue/detailes/view/page/detailsView.dart';
import 'package:news/featrue/home/controller/cubit/artical_cubit.dart';
import 'package:news/featrue/home/model/models/ArticlesModel.dart';
import 'package:news/featrue/home/model/repo/characterepo.dart';
import 'package:news/featrue/home/view/widget/articalWidget.dart';
import 'package:news/featrue/home/view/widget/bodyAllNews.dart';
import 'package:news/featrue/search/view/widgets/textFeilSeach.dart';
import 'package:shimmer/shimmer.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  
    late List<ArticleModel> allArticles;
    List<ArticleModel> SearchArticles = [];
    TextEditingController searchTextController = TextEditingController();
    String onesearch = '';
    bool isseaerch = false;
   Widget build(BuildContext context) { return BlocProvider(
      create: (context) =>
          ArticalCubit(getIt.get<Articlesrepo>())..getAllCharacters(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Textfeilseach(
                    
                searchTextController: searchTextController ,
                onPressed: () {
                   setState(() {
                            searchTextController.clear();
                          });
                          setState(() {
                            isseaerch = false;
                          });

                          setState(() {
                            onesearch = '';
                          });
                },
                onChanged: (p0) {
                   onesearch = p0;
                   SearchArticles = allArticles
                        .where((Articles) => Articles.title
                            .toString()
                            .toLowerCase()
                            .startsWith(onesearch))
                        .toList();
                         setState(() {
                           
                         });
                   
                },
              )),
              SizedBox(
                height: 22,
              ),
              BlocBuilder<ArticalCubit, ArticalState>(
                builder: (context, state) {
                  if (state is Articlesloaded) {
                    allArticles = state.articles;
                    return onesearch.isEmpty
                        ? Expanded(
                           
                            child: ListView.builder(
                              itemCount: allArticles.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailsView(
                                                  article:
                                                      allArticles[index])));
                                    },
                                    child: Articalwidget(
                                      articlesModel: allArticles[index],
                                    ));
                              },
                            ),
                          )
                        : Expanded(
                          
                            child: ListView.builder(
                              itemCount: SearchArticles.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailsView(
                                                  article:
                                                      SearchArticles[index])));
                                    },
                                    child: Articalwidget(
                                      articlesModel: SearchArticles[index],
                                    ));
                              },
                            ),
                          );
                  } else if (state is Articalsfailure) {
                    return Image.asset('assets/images/no_news.png');
                  } else {
                    return ShimmerlistviewAllnews();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


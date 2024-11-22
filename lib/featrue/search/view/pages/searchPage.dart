import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/getit/serviceLecator.dart';
import 'package:news/featrue/detailes/view/page/detailsView.dart';
import 'package:news/featrue/home/controller/cubit/artical_cubit.dart';
import 'package:news/featrue/home/model/repo/characterepo.dart';
import 'package:news/featrue/home/view/widget/articalWidget.dart';
import 'package:news/featrue/home/view/widget/bodyAllNews.dart';
import 'package:news/featrue/search/view/widgets/textFeilSeach.dart';
import 'package:shimmer/shimmer.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticalCubit(getIt.get<Articlesrepo>())..getAllCharacters(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Textfeilseach(
                onPressed: () {},
                onChanged: (p0) {},
              )),
              SizedBox(
                height: 22,
              ),
              BlocBuilder<ArticalCubit, ArticalState>(
                builder: (context, state) {
                  if (state is Articlesloaded) {
                    return SizedBox(
                      height: 700,
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
                        height: 700,
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
        ),
      ),
    );
  }
}

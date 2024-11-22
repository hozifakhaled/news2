import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/enums/enumapp.dart';
import 'package:news/featrue/home/controller/cubit/artical_cubit.dart';
import 'package:news/featrue/home/view/widget/containerTypeNews.dart';

class Rowtypenews extends StatefulWidget {
  const Rowtypenews({super.key});

  @override
  State<Rowtypenews> createState() => _RowtypenewsState();
}

class _RowtypenewsState extends State<Rowtypenews> {  //var newsType = NewsType.AllNews;
  @override
  Widget build(BuildContext context) {
   
   
    return  Row(
              children: [
                ContainerTypeNews(
                  text: 'All News',
                  onTap: () {
                   
                      BlocProvider.of<ArticalCubit>(context).getallnews();
                  
                  },
                  size: BlocProvider.of<ArticalCubit>(context).newsType  == NewsType.AllNews ? 25 : 18,
                ),
                SizedBox(
                  width: 10,
                ),
                ContainerTypeNews(
                  text: 'Top Trding',
                  onTap: () {
                  
                       BlocProvider.of<ArticalCubit>(context).gettopTriding();
                   
                  },
                  size:  BlocProvider.of<ArticalCubit>(context).newsType  == NewsType.toptrding ? 25 : 18,
                ),
              ],
            )
           ;
  }
}
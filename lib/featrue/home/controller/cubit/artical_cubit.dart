import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news/constants.dart';
import 'package:news/core/enums/enumapp.dart';
import 'package:news/featrue/home/model/models/ArticlesModel.dart';
import 'package:news/featrue/home/model/repo/characterepo.dart';

part 'artical_state.dart';

class ArticalCubit extends Cubit<ArticalState> {
  ArticalCubit(this.articlesrepo) : super(ArticalInitial());
  final Articlesrepo articlesrepo;
  var newsType = NewsType.AllNews;
  int currentIndex = 0;
  var newsTypeb = NewsTypeb.publishedAt.name;

  getallnews() {
    newsType = NewsType.AllNews;
    emit(Articalallnews());
  }

  getTypeNewsb(value) {
    newsTypeb = value;
    emit(ArticalsgetTypeNewsb());
  }

  gettopTriding() {
    newsType = NewsType.toptrding;
    emit(Articaltoptrinding());
  }

  getindex(int index) {
    currentIndex = index;
    emit(Articaltindex());
  }

  getIcrementindex() {
    currentIndex = currentIndex + 1;
    emit(Articaltindex());
  }

  getdecrementindex() {
    currentIndex = currentIndex - 1;
    emit(Articaltindex());
  }

  getAllCharacters() async {
    emit(Articalsloading());
    try {
      final articles =
          await articlesrepo.getAllCharacters(newsTypeb, currentIndex + 1);
      if (articles == []) {
        emit(Articalsfailure());
      }else{
      emit(Articlesloaded(articles: articles));}
    } on Exception catch (e) {
      emit(Articalsfailure());
    }
  }
}

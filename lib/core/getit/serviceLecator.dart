import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news/featrue/home/model/repo/characterepo.dart';

import '../../featrue/home/model/webservice/articlesWebService.dart';

GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<Articleswebservice>(Articleswebservice());
  getIt.registerSingleton<Articlesrepo>(Articlesrepo(articleswebservice:getIt.get<Articleswebservice>()));
}
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news/featrue/home/model/repo/characterepo.dart';

import '../../featrue/home/model/webservice/articlesWebService.dart';

GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<Articleswebservice>(Articleswebservice(dio:  createAndSetupDio()));
  getIt.registerSingleton<Articlesrepo>(Articlesrepo(articleswebservice:getIt.get<Articleswebservice>()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio.options.connectTimeout = const Duration(seconds: 20);
  dio.options.receiveTimeout = const Duration(seconds: 10);

  dio.interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    requestHeader: false,
    responseBody: true,
    responseHeader: false,
    error: true,
  ));

  return dio;
}
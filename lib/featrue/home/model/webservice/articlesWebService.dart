import 'package:dio/dio.dart';

class Articleswebservice {
  final Dio dio;

  Articleswebservice({required this.dio});

  Future<dynamic> getAllArticles(String sortBy, int page) async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/everything?q=bitcoin&apiKey=6480eeee24d44bbaad4ec055b70ea2f1&sortBy=$sortBy&page=$page');
      if (response.data['articles'] == null) {
        return [];
      } else {
        return response.data['articles'];
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}

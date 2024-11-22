import 'package:news/featrue/home/model/models/ArticlesModel.dart';
import 'package:news/featrue/home/model/webservice/articlesWebService.dart';

class Articlesrepo {
  final Articleswebservice articleswebservice;

  Articlesrepo({required this.articleswebservice});

  Future<List<ArticleModel>> getAllCharacters(String sortBy, int page) async {
    final articles = await articleswebservice.getAllArticles(sortBy, page);
    List<ArticleModel> data = [];
    if (articles != []||articles!= null) {
      print(articles);
      for (var article in articles) {
        data.add(ArticleModel.fromJson(article));
      }
      return data;
    } else {
      return [];
    }
  }
}

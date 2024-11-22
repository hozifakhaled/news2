part of 'artical_cubit.dart';

@immutable
sealed class ArticalState {}

final class ArticalInitial extends ArticalState {}

final class Articalallnews extends ArticalState {}
final class Articaltindex extends ArticalState {}
final class Articaltoptrinding extends ArticalState {}
final class Articalsfailure extends ArticalState {}
final class Articalsloading extends ArticalState {}
final class ArticalsgetTypeNewsb extends ArticalState {}
final class Articlesloaded extends ArticalState {
  final List<ArticleModel> articles;

  Articlesloaded({required this.articles});
}

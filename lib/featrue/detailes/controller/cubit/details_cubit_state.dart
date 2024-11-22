part of 'details_cubit_cubit.dart';

@immutable
sealed class DetailsCubitState {}

final class DetailsCubitInitial extends DetailsCubitState {}

class ArticleDetailsLoaded extends DetailsCubitState {
  final ArticleModel article;

  ArticleDetailsLoaded(this.article);
}

final class AddArticalloading extends DetailsCubitState {}

final class AddArticalsucsses extends DetailsCubitState {}

final class AddArticalfailire extends DetailsCubitState {
  final String error;

  AddArticalfailire({required this.error});
}

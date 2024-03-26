part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteAdded extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final List<NewsModel> favNews;
  const FavoriteSuccess({required this.favNews});
}

final class FavoriteFailure extends FavoriteState {
  final String errorMessage;

  const FavoriteFailure({required this.errorMessage});
}

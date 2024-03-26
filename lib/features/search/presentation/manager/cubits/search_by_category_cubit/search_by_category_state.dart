part of 'search_by_category_cubit.dart';

sealed class SearchByCategoryState extends Equatable {
  const SearchByCategoryState();

  @override
  List<Object> get props => [];
}

final class SearchByCategoryInitial extends SearchByCategoryState {}

final class SearchByCategoryLoading extends SearchByCategoryState {}

final class SearchByCategorySuccess extends SearchByCategoryState {
  final List<NewsModel> news;

  const SearchByCategorySuccess({required this.news});
}

final class SearchByCategoryFailure extends SearchByCategoryState {
  final String errorMessage;

  const SearchByCategoryFailure({required this.errorMessage});
}

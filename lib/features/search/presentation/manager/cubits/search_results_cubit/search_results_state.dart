part of 'search_results_cubit.dart';

sealed class SearchResultsState extends Equatable {
  const SearchResultsState();

  @override
  List<Object> get props => [];
}

final class SearchResultsInitial extends SearchResultsState {}

final class SearchResultsLoading extends SearchResultsState {}

final class SearchResultsSuccess extends SearchResultsState {
  final List<NewsModel> news;

  const SearchResultsSuccess({required this.news});
}

final class SearchResultsFailure extends SearchResultsState {
  final String errorMessage;

  const SearchResultsFailure({required this.errorMessage});
}

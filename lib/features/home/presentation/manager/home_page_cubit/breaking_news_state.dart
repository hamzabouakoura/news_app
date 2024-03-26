part of 'breaking_news_cubit.dart';

class BreakingNewsState extends Equatable {
  const BreakingNewsState();

  @override
  List<Object> get props => [];
}

class BreakingNewsInitial extends BreakingNewsState {}

class BreakingNewsLoading extends BreakingNewsState {}

class BreakingNewsSuccess extends BreakingNewsState {
  final List<NewsModel> news;

  const BreakingNewsSuccess({required this.news});
}

class BreakingNewsFailure extends BreakingNewsState {
  final String errorMessage;

  const BreakingNewsFailure({required this.errorMessage});
}

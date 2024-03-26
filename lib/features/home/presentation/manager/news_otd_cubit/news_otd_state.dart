part of 'news_otd_cubit.dart';

sealed class NewsOtdState extends Equatable {
  const NewsOtdState();

  @override
  List<Object> get props => [];
}

final class NewsOtdInitial extends NewsOtdState {}

class NewsOfTheDayLoading extends NewsOtdState {}

class NewsOfTheDaySuccess extends NewsOtdState {
  final NewsModel newsOTD;

  const NewsOfTheDaySuccess({required this.newsOTD});
}

class NewsOfTheDayFailure extends NewsOtdState {
  final String errorMessage;

  const NewsOfTheDayFailure({required this.errorMessage});
}
